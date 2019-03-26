library(maptools)


### Name: spCbind-methods
### Title: cbind for spatial objects
### Aliases: spCbind-methods
###   spCbind,SpatialPointsDataFrame,data.frame-method
###   spCbind,SpatialPointsDataFrame,vector-method
###   spCbind,SpatialLinesDataFrame,data.frame-method
###   spCbind,SpatialLinesDataFrame,vector-method
###   spCbind,SpatialPolygonsDataFrame,data.frame-method
###   spCbind,SpatialPolygonsDataFrame,vector-method spCbind
### Keywords: methods spatial

### ** Examples

xx <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
  IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
library(foreign)
xtra <- read.dbf(system.file("share/nc_xtra.dbf", package="maptools")[1])
o <- match(xx$CNTY_ID, xtra$CNTY_ID)
xtra1 <- xtra[o,]
row.names(xtra1) <- xx$FIPSNO
xx1 <- spCbind(xx, xtra1)
names(xx1)
identical(xx1$CNTY_ID, xx1$CNTY_ID.1)



