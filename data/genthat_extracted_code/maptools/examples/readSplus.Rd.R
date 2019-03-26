library(maptools)


### Name: readSplus
### Title: Read exported WinBUGS maps
### Aliases: readSplus
### Keywords: spatial

### ** Examples

if (rgeosStatus()) {
geobugs <- readSplus(system.file("share/Splus.map", package="maptools"))
plot(geobugs, axes=TRUE, col=1:3)
row.names(geobugs)
pls <- slot(geobugs, "polygons")
sapply(pls, function(i) sapply(slot(i, "Polygons"), slot, "hole"))
pls1 <- lapply(pls, checkPolygonsHoles)
sapply(pls1, function(i) sapply(slot(i, "Polygons"), slot, "hole"))
plot(SpatialPolygons(pls1), axes=TRUE, col=1:3)
}



