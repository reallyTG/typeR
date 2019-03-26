library(raster)


### Name: union
### Title: Union Extent or SpatialPolygons* objects
### Aliases: union union,Extent,Extent-method
###   union,SpatialPolygons,SpatialPolygons-method
###   union,SpatialPolygons,missing-method
###   union,SpatialPoints,SpatialPoints-method
###   union,SpatialLines,SpatialLines-method
### Keywords: methods spatial

### ** Examples

e1 <- extent(-10, 10, -20, 20)
e2 <- extent(0, 20, -40, 5)
union(e1, e2)

#SpatialPolygons
if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	p0 <- aggregate(p)
	b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
	projection(b) <- projection(p)
	u <- union(p0, b)
	plot(u, col=2:4)
}



