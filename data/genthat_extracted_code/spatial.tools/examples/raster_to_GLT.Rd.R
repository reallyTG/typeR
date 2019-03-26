library(spatial.tools)


### Name: raster_to_GLT
### Title: Creates a geometry lookup (GLT) file from a raster
### Aliases: raster_to_GLT

### ** Examples

library("raster")
tahoe_lidar_highesthit <- 
	raster(system.file("external/tahoe_lidar_highesthit.tif", package="spatial.tools"))
tahoe_lidar_highesthit_glt <- raster_to_GLT(tahoe_lidar_highesthit)
plot(tahoe_lidar_highesthit_glt)
setMinMax(tahoe_lidar_highesthit_glt)




