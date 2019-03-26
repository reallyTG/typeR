library(mkde)


### Name: initializeMKDE3D
### Title: Set up a 3D MKDE object.
### Aliases: initializeMKDE3D

### ** Examples

library(raster)
data(condordem)
cell.sz <- mean(res(condordem))
ext <- extent(condordem)
nx <- ncol(condordem)
ny <- nrow(condordem)
zmin <- min(values(condordem), na.rm=TRUE)
nz <- 30
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, zmin, cell.sz, nz)



