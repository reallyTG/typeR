library(raster)


### Name: area
### Title: Size of cells
### Aliases: area area,RasterLayer-method area,RasterStackBrick-method
###   area,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples

r <- raster(nrow=18, ncol=36)
a <- area(r)

if (require(rgdal) & require(rgeos)) {
	p <- shapefile(system.file("external/lux.shp", package="raster"))
	p$area <- round(area(p) / 10000000,1)
	p$area
}



