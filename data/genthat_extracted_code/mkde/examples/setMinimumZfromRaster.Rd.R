library(mkde)


### Name: setMinimumZfromRaster
### Title: Set minimum z-axis values from a raster
### Aliases: setMinimumZfromRaster

### ** Examples

library(raster)
data(dugongdem)
cell.sz <- mean(res(dugongdem))
ext <- extent(dugongdem)
nx <- ncol(dugongdem)
ny <- nrow(dugongdem)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(dugongdem), na.rm=TRUE), 50.0, 15)
mkde.obj <- setMinimumZfromRaster(mkde.obj, dugongdem-20.0)



