library(spatial.tools)


### Name: is.Raster
### Title: Tests if an input is a RasterLayer, RasterBrick, or a
###   RasterStack.
### Aliases: is.Raster

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
is.Raster(tahoe_highrez)
tahoe_lidar_bareearth <- 
	raster(system.file("external/tahoe_lidar_bareearth.tif", package="spatial.tools"))
is.Raster(tahoe_lidar_bareearth)
is.Raster("character")



