library(raster)


### Name: distanceFromPoints
### Title: Distance from points
### Aliases: distanceFromPoints
### Keywords: spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
xy <- c(0,0)
d1 <- distanceFromPoints(r, xy) 
crs(r) = '+proj=utm +zone=12 +datum=WGS84'
d2 <- distanceFromPoints(r, xy) 
par(mfrow=c(1,2))
plot(d1)
plot(d2)



