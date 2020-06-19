# Use image as a base
FROM node:alpine
WORKDIR '/usr/app'
# Download and install a dependency
COPY package*.json ./
RUN npm install
COPY . .
# Tell the image what to do when it starts as a container.
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html