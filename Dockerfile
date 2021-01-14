FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# epose port only for Elastic beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
