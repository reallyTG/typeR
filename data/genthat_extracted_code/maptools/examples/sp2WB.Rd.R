library(maptools)


### Name: sp2WB
### Title: Export SpatialPolygons object as S-Plus map for WinBUGS
### Aliases: sp2WB
### Keywords: spatial

### ** Examples

xx <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))
plot(xx, border="blue", axes=TRUE, las=1)
tf <- tempfile()
sp2WB(as(xx, "SpatialPolygons"), filename=tf)
xxx <- readSplus(tf, proj4string=CRS("+proj=longlat +ellps=clrk66"))
all.equal(xxx, as(xx, "SpatialPolygons"), tolerance=.Machine$double.eps^(1/4),
 check.attributes=FALSE)
## Not run: 
##D x <- readAsciiGrid(system.file("grids/test.ag", package="maptools")[1])
##D xp <- as(x, "SpatialPixelsDataFrame")
##D pp <- as(xp, "SpatialPolygons")
##D sp2WB(pp, filename="test.map")
## End(Not run)



