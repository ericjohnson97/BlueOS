docker build -t bluerobotics/blueos-bootstrap:master .
docker stop blueos-bootstrap 
docker container rm blueos-bootstrap
docker create \
    -t \
    --restart unless-stopped \
    --name blueos-bootstrap \
    --net=host \
    -v /root/.config/blueos/bootstrap:/root/.config/bootstrap \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/logs/blueos:/var/logs/blueos \
    -e BLUEOS_CONFIG_PATH=/root/.config/blueos \
    bluerobotics/blueos-bootstrap:master
