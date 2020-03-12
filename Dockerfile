FROM node:10

# set maintainer
LABEL maintainer "lim.ac96@gmail.com"

# set a health check
HEALTHCHECK --interval=5s \
    --timeout=5s \
    CMD curl -f http://127.0.0.1:80 || exit 1

# tell docker what port to expose

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
CMD [ "npm", "run", "start" ]