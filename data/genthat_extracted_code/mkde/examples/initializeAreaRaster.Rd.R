library(mkde)


### Name: initializeAreaRaster
### Title: Initialize an area raster for a 2.5D MKDE.
### Aliases: initializeAreaRaster

### ** Examples

library(raster)
data(pandadem)
cell.sz <- mean(res(pandadem))
ext <- extent(pandadem)
nx <- ncol(pandadem)
ny <- nrow(pandadem)
mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz, ny)

mkde.obj <- setMinimumZfromRaster(mkde.obj, pandadem)
mkde.obj <- initializeAreaRaster(mkde.obj)



