library(mkde)


### Name: mkde2Dgrid
### Title: Movement-based kernel density estimate (MKDE) in 2D using Rcpp
### Aliases: mkde2Dgrid

### ** Examples

library(raster)
data(panda)
mv.dat <- initializeMovementData(panda$time, panda$x,
panda$y, t.max=185.0, sig2obs=25.0)
mv.dat <- initializeMovementData(panda$time, panda$x, panda$y, 
sig2obs=25.0, t.max=185.0)

data(pandadem)
cell.sz <- mean(res(pandadem))
ext <- extent(pandadem)
nx <- ncol(pandadem)
ny <- nrow(pandadem)
mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz, ny)

res <- mkde2Dgrid(mkde.obj, mv.dat, 10.0, 1e-20)



