library(maptools)


### Name: symbolsInPolys
### Title: Place grids of points over polygons
### Aliases: symbolsInPolys
### Keywords: spatial

### ** Examples

nc_SP <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat +ellps=clrk66"))
## Not run: 
##D pls <- slot(nc_SP, "polygons")
##D pls_new <- lapply(pls, checkPolygonsHoles)
##D nc_SP <- SpatialPolygonsDataFrame(SpatialPolygons(pls_new,
##D  proj4string=CRS(proj4string(nc_SP))), data=as(nc_SP, "data.frame"))
## End(Not run)
symbs <- c("-", "+", "x")
np <- sapply(slot(nc_SP, "polygons"), function(x) length(slot(x, "Polygons")))
try1 <- symbolsInPolys(nc_SP, 100, symb=symbs[np])
plot(nc_SP, axes=TRUE)
plot(try1, add=TRUE, pch=as.character(try1$symb))



