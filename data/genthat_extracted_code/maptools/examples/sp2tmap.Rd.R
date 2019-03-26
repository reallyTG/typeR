library(maptools)


### Name: sp2tmap
### Title: Convert SpatialPolygons object for Stata tmap command
### Aliases: sp2tmap
### Keywords: spatial

### ** Examples

## Not run: 
##D xx <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
##D  IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
##D plot(xx, border="blue", axes=TRUE, las=1)
##D tmapdf <- sp2tmap(as(xx, "SpatialPolygons"))
##D if (require(foreign)) {
##D write.dta(tmapdf, file="NCmap.dta", version=7)
##D NCdf <- as(xx, "data.frame")
##D NCdf$ID_n <- attr(tmapdf, "ID_names")
##D write.dta(NCdf, file="NC.dta", version=7)
##D }
## End(Not run)



