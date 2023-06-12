# stage 1 - build the image, generate dist folder
FROM node:18.16.0 as node
RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2 - image to run the application
FROM nginx:alpine
COPY --from=node /app/dist/angular-docker-app /usr/share/nginx/html

# stage 3 - steps 
# docker build -t angular-docker-app .
# docker images
# docker run -d -it -p 80:80 angular-docker-app
# docker ps -a
# docker run -d -it -p 7500:80 angular-docker-app
# docker container stop <id>