library(maptools)


### Name: dotsInPolys
### Title: Put dots in polygons
### Aliases: dotsInPolys
### Keywords: spatial

### ** Examples

nc_SP <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat  +ellps=clrk66"))
## Not run: 
##D pls <- slot(nc_SP, "polygons")
##D pls_new <- lapply(pls, checkPolygonsHoles)
##D nc_SP <- SpatialPolygonsDataFrame(SpatialPolygons(pls_new,
##D  proj4string=CRS(proj4string(nc_SP))), data=as(nc_SP, "data.frame"))
## End(Not run)
try1 <- dotsInPolys(nc_SP, as.integer(nc_SP$SID74))
plot(nc_SP, axes=TRUE)
plot(try1, add=TRUE, pch=18, col="red")
try2 <- dotsInPolys(nc_SP, as.integer(nc_SP$SID74), f="regular")
plot(nc_SP, axes=TRUE)
plot(try2, add=TRUE, pch=18, col="red")



