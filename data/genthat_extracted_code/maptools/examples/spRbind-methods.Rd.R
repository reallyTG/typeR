library(maptools)


### Name: spRbind-methods
### Title: rbind for spatial objects
### Aliases: spRbind-methods spRbind,SpatialPoints,SpatialPoints-method
###   spRbind,SpatialPointsDataFrame,SpatialPointsDataFrame-method
###   spRbind,SpatialLines,SpatialLines-method
###   spRbind,SpatialLinesDataFrame,SpatialLinesDataFrame-method
###   spRbind,SpatialPolygons,SpatialPolygons-method
###   spRbind,SpatialPolygonsDataFrame,SpatialPolygonsDataFrame-method
###   spRbind
### Keywords: methods spatial

### ** Examples

xx <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
  IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
summary(xx)
xx$FIPSNO
xx1 <- xx[xx$CNTY_ID < 1982,]
xx2 <- xx[xx$CNTY_ID >= 1982,]
xx3 <- spRbind(xx2, xx1)
summary(xx3)
xx3$FIPSNO



