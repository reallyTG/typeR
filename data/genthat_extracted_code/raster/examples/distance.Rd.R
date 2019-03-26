library(raster)


### Name: distance
### Title: Distance
### Aliases: distance distance,RasterLayer,missing-method
###   distance,RasterLayer,RasterLayer-method
###   distance,Spatial,Spatial-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
r[] <- NA
r[500] <- 1
dist <- distance(r) 
#plot(dist / 1000)



