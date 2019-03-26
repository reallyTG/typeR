library(gdalUtils)


### Name: is.Raster
### Title: Tests if an input is a RasterLayer, RasterBrick, or a
###   RasterStack.
### Aliases: is.Raster

### ** Examples

if(require(raster) && require(rgdal))
{
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="gdalUtils"))
is.Raster(tahoe_highrez)
tahoe_lidar_bareearth <- 
	raster(system.file("external/tahoe_lidar_bareearth.tif", package="gdalUtils"))
is.Raster(tahoe_lidar_bareearth)
is.Raster("character")
}



