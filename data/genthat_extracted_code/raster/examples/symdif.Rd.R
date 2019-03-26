library(raster)


### Name: symdif
### Title: Symetrical difference
### Aliases: symdif symdif,SpatialPolygons,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples

#SpatialPolygons
if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	b <- as(extent(6, 6.4, 49.75, 50), 'SpatialPolygons')
	projection(b) <- projection(p)
	sd <- symdif(p, b)
	plot(sd, col='red')
}



