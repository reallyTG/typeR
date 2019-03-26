library(spatial.tools)


### Name: tahoe_lidar_bareearth.tif
### Title: Lidar-derived bare earth digital elevation model from the Lake
###   Tahoe Basin.
### Aliases: tahoe_lidar_bareearth.tif
### Keywords: data

### ** Examples

library("raster")
tahoe_lidar_bareearth <- 
	raster(system.file("external/tahoe_lidar_bareearth.tif", package="spatial.tools"))
plot(tahoe_lidar_bareearth)



