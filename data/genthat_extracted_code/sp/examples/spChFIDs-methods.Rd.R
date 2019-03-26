library(sp)


### Name: spChFIDs-methods
### Title: change feature IDs in spatial objects
### Aliases: spChFIDs-methods spChFIDs<- spChFIDs<-,Spatial-method
###   spChFIDs,SpatialLines,character-method
###   spChFIDs,SpatialLinesDataFrame,character-method
###   spChFIDs,SpatialPolygons,character-method
###   spChFIDs,SpatialPolygonsDataFrame,character-method spChFIDs
### Keywords: methods spatial

### ** Examples

## Not run: 
##D require(maptools)
##D xx <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
##D   IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
##D row.names(as(xx, "data.frame"))
##D xx1 <- spChFIDs(xx, as.character(xx$CNTY_ID))
##D row.names(as(xx1, "data.frame"))
## End(Not run)



