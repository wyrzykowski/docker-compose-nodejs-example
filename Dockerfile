# select NodeJS source image with specific version
FROM node:14

# create on container custom directory (src dir is not used in this example)
RUN mkdir /src

# set workdir (the directory where next commands e.g. "RUN npm install" or "CMD npm start" will be runned)
# Notice that WORKDIR should correspond with second part of the "volumes" item property from docker-compose.yml file. ("./app:/var/lib/app") => "/var/lib" 
WORKDIR /var/lib

# copy "app/package.json" from local development directory to "/var/lib/package.json" on docker container
ADD app/package.json /var/lib/package.json

# run command to prepare and run application
RUN npm install

# CMD command is runned when you run "docker-compose up"
CMD npm start

# Expose ports without publishing them to the host machine - they’ll only be accessible to linked services.
EXPOSE 3000