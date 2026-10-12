cat <<EOF > Dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EOF

docker build -t my-app .
docker stop website || true
docker rm website || true
docker run -d -p 8085:80 --name=website my-app
