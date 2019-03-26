library(sp)


### Name: geometry-methods
### Title: Methods for retrieving the geometry from a composite (geometry +
###   attributes) object
### Aliases: geometry geometry-methods geometry,Spatial-method
###   geometry,SpatialPointsDataFrame-method
###   geometry,SpatialMultiPointsDataFrame-method
###   geometry,SpatialGridDataFrame-method
###   geometry,SpatialPixelsDataFrame-method
###   geometry,SpatialLinesDataFrame-method
###   geometry,SpatialPolygonsDataFrame-method geometry<-
###   geometry<-,data.frame,Spatial-method
### Keywords: methods

### ** Examples

data(meuse)
m = meuse
coordinates(m) = meuse[, c("x", "y")]
pts = geometry(m)
class(pts)
geometry(meuse) = pts
class(meuse)
identical(m, meuse) # TRUE



