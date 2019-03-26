library(maptools)


### Name: SpatialLines2PolySet
### Title: Convert sp line and polygon objects to PBSmapping PolySet
###   objects
### Aliases: SpatialLines2PolySet SpatialPolygons2PolySet
###   PolySet2SpatialPolygons PolySet2SpatialLines
### Keywords: spatial

### ** Examples

if(require(PBSmapping) && require(maps)) {
nor_coast_lines <- map("world", interior=FALSE, plot=FALSE, xlim=c(4,32),
 ylim=c(58,72))
nor_coast_lines <- pruneMap(nor_coast_lines, xlim=c(4,32), ylim=c(58,72))
nor_coast_lines_sp <- map2SpatialLines(nor_coast_lines,
 proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84"))
nor_coast_lines_PS <- SpatialLines2PolySet(nor_coast_lines_sp)
summary(nor_coast_lines_PS)
plotLines(nor_coast_lines_PS)
o3 <- PolySet2SpatialLines(nor_coast_lines_PS)
plot(o3, axes=TRUE)
nor_coast_poly <- map("world", "norway", fill=TRUE, col="transparent",
 plot=FALSE, ylim=c(58,72))
IDs <- sapply(strsplit(nor_coast_poly$names, ":"), function(x) x[1])
nor_coast_poly_sp <- map2SpatialPolygons(nor_coast_poly, IDs=IDs,
 proj4string=CRS("+proj=longlat +datum=WGS84 +ellps=WGS84"))
nor_coast_poly_PS <- SpatialPolygons2PolySet(nor_coast_poly_sp)
summary(nor_coast_poly_PS)
plotPolys(nor_coast_poly_PS)
o1 <- PolySet2SpatialPolygons(nor_coast_poly_PS)
plot(o1, axes=TRUE)
}



