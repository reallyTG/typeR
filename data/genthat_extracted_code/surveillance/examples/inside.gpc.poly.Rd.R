library(surveillance)


### Name: inside.gpc.poly
### Title: Test Whether Points are Inside a '"gpc.poly"' Polygon
### Aliases: inside.gpc.poly
### Keywords: utilities spatial

### ** Examples

if (requireNamespace("rgeos")) {
    poly <- discpoly(c(0.5,0.5), 0.5, npoly=4, class="gpc.poly")
    pts <- cbind(x=runif(50), y=runif(50))
    plot(poly)
    points(pts, col=1+inside.gpc.poly(pts, polyregion=poly))
}



