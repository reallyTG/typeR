library(spatial.tools)


### Name: spatial_sync_vector
### Title: Matches a vector's projection to another vector or raster
###   object's projection.
### Aliases: spatial_sync_vector

### ** Examples

library("rgdal")
library("raster")
tahoe_highrez_training_points_utm <- readOGR(
	dsn=system.file("external", package="spatial.tools"),
	layer="tahoe_highrez_training_points_utm")
print(projection(tahoe_highrez_training_points_utm))
tahoe_lidar_bareearth <- 
	raster(system.file("external/tahoe_lidar_bareearth.tif", package="spatial.tools"))
print(projection(tahoe_lidar_bareearth))
tahoe_highrez_training_points_utm_synced <- 
	spatial_sync_vector(tahoe_highrez_training_points_utm,tahoe_lidar_bareearth)
print(projection(tahoe_highrez_training_points_utm_synced))



