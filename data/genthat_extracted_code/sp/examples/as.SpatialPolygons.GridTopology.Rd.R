library(sp)


### Name: as.SpatialPolygons.GridTopology
### Title: Make SpatialPolygons object from GridTopology object
### Aliases: as.SpatialPolygons.GridTopology
###   coerce,GridTopology,SpatialPolygons-method HexPoints2SpatialPolygons
###   IDvaluesGridTopology as.SpatialPolygons.SpatialPixels
###   coerce,SpatialPixels,SpatialPolygons-method IDvaluesSpatialPixels
### Keywords: spatial

### ** Examples

library(lattice)
grd <- GridTopology(cellcentre.offset=c(-175,55), cellsize=c(10,10), cells.dim=c(4,4))
SpP_grd <- as.SpatialPolygons.GridTopology(grd)
plot(SpP_grd)
text(coordinates(SpP_grd), sapply(slot(SpP_grd, "polygons"), function(i) slot(i, "ID")), cex=0.5)
trdata <- data.frame(A=rep(c(1,2,3,4), 4), B=rep(c(1,2,3,4), each=4),
 row.names=sapply(slot(SpP_grd, "polygons"), function(i) slot(i, "ID")))
SpPDF <- SpatialPolygonsDataFrame(SpP_grd, trdata)
spplot(SpPDF)

data(meuse.grid)
gridded(meuse.grid)=~x+y
xx = spsample(meuse.grid,  type="hexagonal", cellsize=200)
xxpl = HexPoints2SpatialPolygons(xx)
image(meuse.grid["dist"])
plot(xxpl, add = TRUE)
points(xx, cex = .5)
## Not run: 
##D spplot(aggregate(meuse.grid[,1:3], xxpl), main = "aggregated meuse.grid")
## End(Not run)



