library(sp)


### Name: degAxis
### Title: axis with degrees
### Aliases: degAxis
### Keywords: dplot

### ** Examples

xy = cbind(x = 2 * runif(100) - 1, y = 2 * runif(100) - 1)
plot(SpatialPoints(xy, proj4string = CRS("+proj=longlat +ellps=WGS84")),xlim=c(-1,1),ylim=c(-1,1))
degAxis(1)
degAxis(2, at = c(-1,-0.5,0,0.5,1))
#



