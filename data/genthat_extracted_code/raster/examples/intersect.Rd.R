library(raster)


### Name: intersect
### Title: Intersect
### Aliases: intersect intersect,Extent,ANY-method
###   intersect,Raster,ANY-method intersect,SpatialPoints,ANY-method
###   intersect,SpatialPolygons,SpatialPolygons-method
###   intersect,SpatialPolygons,SpatialLines-method
###   intersect,SpatialPolygons,SpatialPoints-method
###   intersect,SpatialPolygons,ANY-method
###   intersect,SpatialLines,SpatialPolygons-method
###   intersect,SpatialLines,SpatialLines-method
### Keywords: methods spatial

### ** Examples

e1 <- extent(-10, 10, -20, 20)
e2 <- extent(0, 20, -40, 5)
intersect(e1, e2)

#SpatialPolygons
if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
	projection(b) <- projection(p)
	i <- intersect(p, b)
	plot(p)
	plot(b, add=TRUE, col='red')
	plot(i, add=TRUE, col='blue', lwd=2)
}



