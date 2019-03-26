library(raster)


### Name: flowPath
### Title: Flow path
### Aliases: flowPath
### Keywords: spatial

### ** Examples

data(volcano)
v <- raster(volcano, xmn=2667400, xmx=2668010, ymn=6478700, ymx=6479570, crs="+init=epsg:27200")
fd <- terrain(v, opt = "flowdir")

path <- flowPath(fd, 2407)
xy <- xyFromCell(fd, path)
plot(v)
lines(xy)



