library(maptools)


### Name: thinnedSpatialPoly
### Title: Douglas-Peuker line generalization for Spatial Polygons
### Aliases: thinnedSpatialPoly
### Keywords: spatial

### ** Examples

xx <- readShapeSpatial(system.file("shapes/sids.shp", package="maptools")[1],
      IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
object.size(as(xx, "SpatialPolygons"))
xxx <- thinnedSpatialPoly(xx, tolerance=0.05, minarea=0.001)
object.size(as(xxx, "SpatialPolygons"))
par(mfrow=c(2,1))
plot(xx)
plot(xxx)
par(mfrow=c(1,1))



