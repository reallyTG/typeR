library(mkde)


### Name: setMaximumZfromRaster
### Title: Initialize maximum z-axis value from a raster
### Aliases: setMaximumZfromRaster

### ** Examples

library(raster)
data(dugongdem)
cell.sz <- mean(res(dugongdem))
ext <- extent(dugongdem)
nx <- ncol(dugongdem)
ny <- nrow(dugongdem)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(dugongdem), na.rm=TRUE), 50.0, 15)
mkde.obj <- setMaximumZfromRaster(mkde.obj, dugongdem)



