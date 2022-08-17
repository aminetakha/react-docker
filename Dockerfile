FROM node:16-alpine as builder
WORKDIR /app
COPY package.json /app/
RUN yarn install
COPY . /app/
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html