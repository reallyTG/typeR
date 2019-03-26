library(mkde)


### Name: setMinimumZfromConstant
### Title: Set minimum z-axis value to a constant.
### Aliases: setMinimumZfromConstant

### ** Examples

library(raster)
data(dugongdem)
cell.sz <- mean(res(dugongdem))
ext <- extent(dugongdem)
nx <- ncol(dugongdem)
ny <- nrow(dugongdem)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(dugongdem), na.rm=TRUE), 50.0, 15)
mkde.obj <- setMinimumZfromConstant(mkde.obj, -20.0)



