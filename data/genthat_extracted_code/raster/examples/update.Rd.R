library(raster)


### Name: update
### Title: Update raster cells of files (on disk)
### Aliases: update update,RasterLayer-method update,RasterBrick-method
### Keywords: methods spatial

### ** Examples

# setting up an example RasterLayer with file
r <- raster(nrow=5, ncol=10)
r[] = 0
r <- writeRaster(r, 'test', overwrite=TRUE, datatype='INT2S')
as.matrix(r)

# update with a vector starting a cell
r <- update(r, v=rep(1, 5), cell=6)
# 99.99 gets rounded because this is an integer file
r <- update(r, v=9.99, cell=50)
as.matrix(r)

# update with a vector of values and matching vector of cell numbers
r <- update(r, v=5:1, cell=c(5,15,25,35,45))
as.matrix(r)

# updating with a marix, anchored at a cell number
m = matrix(1:10, ncol=2)
r <- update(r, v=m, cell=2)
as.matrix(r)



