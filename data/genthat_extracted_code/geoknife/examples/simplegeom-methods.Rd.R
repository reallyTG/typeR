library(geoknife)


### Name: simplegeom
### Title: Create simplegeom object
### Aliases: simplegeom simplegeom,missing-method simplegeom,ANY-method

### ** Examples

simplegeom(c(-88.6, 45.2))
## Not run: 
##D library(sp)
##D Sr1 <- Polygon(cbind(c(-89.0001,-89,-88.9999,-89,-89.0001),c(46,46.0001,46,45.9999,46)))
##D Sr2 <- Polygon(cbind(c(-88.6,-88.5999,-88.5999,-88.6,-88.6),c(45.2,45.2,45.1999,45.1999,45.2)))
##D Srs1 <- Polygons(list(Sr1), "s1")
##D Srs2 <- Polygons(list(Sr2), "s2")
##D SP <- SpatialPolygons(list(Srs1,Srs2), proj4string = CRS("+proj=longlat +datum=WGS84"))
##D result(geoknife(simplegeom(SP), 'prism', wait=TRUE))
## End(Not run)
simplegeom(data.frame('point1'=c(-89, 46), 'point2'=c(-88.6, 45.2)))



