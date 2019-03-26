library(mkde)


### Name: setMaximumZfromConstant
### Title: Initialize maximum allowable z-axis coordinates to a constant
###   value.
### Aliases: setMaximumZfromConstant

### ** Examples

library(raster)
data(dugongdem)
cell.sz <- mean(res(dugongdem))
ext <- extent(dugongdem)
nx <- ncol(dugongdem)
ny <- nrow(dugongdem)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(dugongdem), na.rm=TRUE), 50.0, 15)
mkde.obj <- setMaximumZfromConstant(mkde.obj, 100.0)



