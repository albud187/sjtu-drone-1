XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority

xhost +local:docker
docker run \
    -it --rm \
    $VOLUMES \
    -v ${XSOCK}:${XSOCK} \
    -v ${XAUTH}:${XAUTH} \
    -e DISPLAY=${DISPLAY} \
    -e XAUTHORITY=${XAUTH} \
    --env=QT_X11_NO_MITSHM=1 \
    --privileged \
    --net=host \
    stju_humble
xhost -local:docker
