library(mkde)


### Name: plotMKDE
### Title: Make an image plot of an MKDE.
### Aliases: plotMKDE

### ** Examples

library(raster)
data(pandadem)
cell.sz <- 0.25*mean(res(pandadem))
ext <- extent(pandadem)
nx <- 4*ncol(pandadem)
ny <- 4*nrow(pandadem)
mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny)

# set up movement data
data(panda)
mv.dat <- initializeMovementData(panda$time, panda$x, panda$y, 
sig2obs=25.0, t.max=185.0)

# estimate density
dens.res <- initializeDensity(mkde.obj, mv.dat)
mkde.obj <- dens.res$mkde.obj
mv.dat <- dens.res$move.dat
plotMKDE(mkde.obj)



