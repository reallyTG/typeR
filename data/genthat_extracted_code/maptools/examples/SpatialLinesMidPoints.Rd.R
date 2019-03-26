library(maptools)


### Name: SpatialLinesMidPoints
### Title: Line midpoints
### Aliases: SpatialLinesMidPoints
### Keywords: spatial

### ** Examples

xx <- readShapeLines(system.file("shapes/fylk-val.shp", package="maptools")[1],
 proj4string=CRS("+proj=utm +zone=33 +datum=WGS84"))
plot(xx, col="blue")
spdf <- SpatialLinesMidPoints(xx)
plot(spdf, col="orange", add=TRUE)



