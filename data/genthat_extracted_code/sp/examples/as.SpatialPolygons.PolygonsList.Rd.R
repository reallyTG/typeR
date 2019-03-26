library(sp)


### Name: as.SpatialPolygons.PolygonsList
### Title: Making SpatialPolygons objects
### Aliases: as.SpatialPolygons.PolygonsList
### Keywords: spatial

### ** Examples

grd <- GridTopology(c(1,1), c(1,1), c(10,10))
polys <- as.SpatialPolygons.GridTopology(grd)
plot(polys)
text(coordinates(polys), labels=sapply(slot(polys, "polygons"), function(i) slot(i, "ID")), cex=0.6)



