library(maptools)


### Name: elide-methods
### Title: Methods for Function elide in Package 'maptools'
### Aliases: elide-methods elide,SpatialPoints-method
###   elide,SpatialPointsDataFrame-method elide,SpatialLines-method
###   elide,SpatialLinesDataFrame-method elide,SpatialPolygons-method
###   elide,SpatialPolygonsDataFrame-method elide
### Keywords: methods spatial

### ** Examples

data(meuse)
coordinates(meuse) <- c("x", "y")
proj4string(meuse) <- CRS("+init=epsg:28992")
data(meuse.riv)
river_polygon <- Polygons(list(Polygon(meuse.riv)), ID="meuse")
rivers <- SpatialPolygons(list(river_polygon))
proj4string(rivers) <- CRS("+init=epsg:28992")
rivers1 <- elide(rivers, reflect=c(TRUE, TRUE), scale=TRUE)
meuse1 <- elide(meuse, bb=bbox(rivers), reflect=c(TRUE, TRUE), scale=TRUE)
opar <- par(mfrow=c(1,2))
plot(rivers, axes=TRUE)
plot(meuse, add=TRUE)
plot(rivers1, axes=TRUE)
plot(meuse1, add=TRUE)
par(opar)
meuse1 <- elide(meuse, shift=c(10000, -10000))
bbox(meuse)
bbox(meuse1)
rivers1 <- elide(rivers, shift=c(10000, -10000))
bbox(rivers)
bbox(rivers1)
meuse1 <- elide(meuse, rotate=-30, center=apply(bbox(meuse), 1, mean))
bbox(meuse)
bbox(meuse1)
plot(meuse1, axes=TRUE)



