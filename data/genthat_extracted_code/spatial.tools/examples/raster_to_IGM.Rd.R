library(spatial.tools)


### Name: raster_to_IGM
### Title: Creates an input geometry (IGM) file from a raster
### Aliases: raster_to_IGM

### ** Examples

library("raster")
tahoe_lidar_highesthit <- 
	raster(system.file("external/tahoe_lidar_highesthit.tif", package="spatial.tools"))
tahoe_lidar_highesthit_igm <- raster_to_IGM(tahoe_lidar_highesthit)
plot(tahoe_lidar_highesthit_igm)
setMinMax(tahoe_lidar_highesthit_igm)




