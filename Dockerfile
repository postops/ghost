FROM ghost:2.1
MAINTAINER mootpt 

COPY ./package.json /var/lib/ghost/package.json

# s3 storage driver for backend storage
WORKDIR /var/lib/ghost
RUN mkdir -p ./content.orig/adapters/storage/s3 && \
    npm install ghost-storage-adapter-s3 && \
    cp -r ./node_modules/ghost-storage-adapter-s3/* ./content.orig/adapters/storage/s3

COPY ./config.json /var/lib/ghost/config.production.json
