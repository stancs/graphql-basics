FROM node:12.17 as dev

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

FROM dev as build

COPY . .

#RUN npm run build

FROM node:12.17 as prod

#RUN apt-get -y update
#RUN apt-get -y install jq

WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
# To test docker in local machine
#COPY --from=build /usr/src/app/.env .
#ENV NODE_ENV=development
#ENV PORT="8080"

EXPOSE 4000
CMD [ "npm", "start" ]
