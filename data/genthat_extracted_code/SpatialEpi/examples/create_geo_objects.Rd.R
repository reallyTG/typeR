library(SpatialEpi)


### Name: create_geo_objects
### Title: Create geographical objects to be used in Bayesian Cluster
###   Detection Method
### Aliases: create_geo_objects
### Keywords: file

### ** Examples

data(pennLC)
max.prop <- 0.15
population <- tapply(pennLC$data$population, pennLC$data$county, sum)
centroids <- latlong2grid(pennLC$geo[, 2:3])
sp.obj <- pennLC$spatial.polygon
output <- create_geo_objects(max.prop, population, centroids, sp.obj)

## number of single zones
nrow(output$cluster.coords)



