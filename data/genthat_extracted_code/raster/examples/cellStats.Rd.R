library(raster)


### Name: cellStats
### Title: Statistics across cells
### Aliases: cellStats cellStats,RasterLayer-method
###   cellStats,RasterStackBrick-method
### Keywords: spatial univar

### ** Examples

r <- raster(nrow=18, ncol=36)
r[] <- runif(ncell(r)) * 10
# works for large files
cellStats(r, 'mean')
# same, but does not work for very large files
cellStats(r, mean)
# multi-layer object
cellStats(brick(r,r), mean)



