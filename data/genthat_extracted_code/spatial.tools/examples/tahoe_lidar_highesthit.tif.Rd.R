library(spatial.tools)


### Name: tahoe_lidar_highesthit.tif
### Title: Lidar-derived highest hit (aka canopy) digital elevation model
###   from the Lake Tahoe Basin.
### Aliases: tahoe_lidar_highesthit.tif
### Keywords: data

### ** Examples

library("raster")
tahoe_lidar_highesthit <- 
	raster(system.file("external/tahoe_lidar_highesthit.tif", package="spatial.tools"))
plot(tahoe_lidar_highesthit)



