library(raster)


### Name: Arith-methods
### Title: Arithmetic with Raster* objects
### Aliases: Arith-methods Arith,Extent,numeric-method
###   Arith,Raster,Raster-method Arith,Raster,missing-method
###   Arith,RasterLayer,logical-method Arith,RasterLayer,numeric-method
###   Arith,RasterLayerSparse,numeric-method
###   Arith,RasterStackBrick,logical-method
###   Arith,RasterStackBrick,numeric-method
###   Arith,logical,RasterLayer-method
###   Arith,logical,RasterStackBrick-method Arith,numeric,Extent-method
###   Arith,numeric,RasterLayer-method
###   Arith,numeric,RasterLayerSparse-method
###   Arith,numeric,RasterStackBrick-method
###   +,SpatialPolygons,SpatialPolygons-method
###   +,SpatialLines,SpatialLines-method
###   +,SpatialPoints,SpatialPoints-method
###   -,SpatialPolygons,SpatialPolygons-method
###   *,SpatialPolygons,SpatialPolygons-method
### Keywords: methods math spatial

### ** Examples

r1 <- raster(ncols=10, nrows=10)
r1[] <- runif(ncell(r1))
r2 <- setValues(r1, 1:ncell(r1) / ncell(r1) )
r3 <- r1 + r2
r2 <- r1 / 10
r3 <- r1 * (r2 - 1 + r1^2 / r2)

# recycling by row
r4 <- r1 * 0 + 1:ncol(r1)

# multi-layer object mutiplication, no recycling
b1 <- brick(r1, r2, r3)
b2 <- b1 * 10

# recycling by layer
b3 <- b1 + c(1, 5, 10)

# addition of the cell-values of two RasterBrick objects
b3 <- b2 + b1

# summing two RasterBricks and one RasterLayer. The RasterLayer is 'recycled'
b3 <- b1 + b2 + r1



