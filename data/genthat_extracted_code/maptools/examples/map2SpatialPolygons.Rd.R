library(maptools)


### Name: map2SpatialPolygons
### Title: Convert map objects to sp classes
### Aliases: map2SpatialPolygons map2SpatialLines pruneMap
### Keywords: spatial

### ** Examples

if(require(maps)) {
nor_coast_poly <- map("world", "norway", fill=TRUE, col="transparent",
 plot=FALSE)
range(nor_coast_poly$x, na.rm=TRUE)
range(nor_coast_poly$y, na.rm=TRUE)
nor_coast_poly <- map("world", "norway", fill=TRUE, col="transparent",
 plot=FALSE, ylim=c(58,72))
nor_coast_poly$names
IDs <- sapply(strsplit(nor_coast_poly$names, ":"), function(x) x[1])
nor_coast_poly_sp <- map2SpatialPolygons(nor_coast_poly, IDs=IDs,
 proj4string=CRS("+proj=longlat +datum=WGS84"))
sapply(slot(nor_coast_poly_sp, "polygons"),
 function(x) length(slot(x, "Polygons")))
plot(nor_coast_poly_sp, col="grey", axes=TRUE)
nor_coast_lines <- map("world", interior=FALSE, plot=FALSE, xlim=c(4,32),
 ylim=c(58,72))
plot(nor_coast_lines, type="l")
nor_coast_lines <- pruneMap(nor_coast_lines, xlim=c(4,32), ylim=c(58,72))
lines(nor_coast_lines, col="red")
nor_coast_lines_sp <- map2SpatialLines(nor_coast_lines,
 proj4string=CRS("+proj=longlat +datum=WGS84"))
plot(nor_coast_poly_sp, col="grey", axes=TRUE)
plot(nor_coast_lines_sp, col="blue", add=TRUE)
worldmap <- map("world", fill=TRUE, plot=FALSE)
worldmapPolys <- map2SpatialPolygons(worldmap, 
 IDs=sapply(strsplit(worldmap$names, ":"), "[", 1L), 
 proj4string=CRS("+proj=longlat +datum=WGS84"))
if (rgeosStatus()) {
require(rgeos)
vals <- rgeos::gIsValid(worldmapPolys, byid=TRUE, reason=TRUE)
print(table(sapply(strsplit(vals, "\\["), "[", 1)))
}
}



