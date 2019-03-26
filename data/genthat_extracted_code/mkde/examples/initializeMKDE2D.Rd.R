library(mkde)


### Name: initializeMKDE2D
### Title: Set up a 2D MKDE object.
### Aliases: initializeMKDE2D

### ** Examples

library(raster)
data(pandadem)
cell.sz <- mean(res(pandadem))
ext <- extent(pandadem)
nx <- ncol(pandadem)
ny <- nrow(pandadem)
mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz, ny)



