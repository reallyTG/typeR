library(mkde)


### Name: mkdeToRaster
### Title: MKDE to RasterLayer or RasterStack
### Aliases: mkdeToRaster

### ** Examples

## Not run: 
##D library(raster)
##D # set up MKDE object
##D data(pandadem)
##D cell.sz <- mean(res(pandadem))
##D ext <- extent(pandadem)
##D nx <- ncol(pandadem)
##D ny <- nrow(pandadem)
##D mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz, ny)
##D 
##D # set up movement data
##D data(panda)
##D mv.dat <- initializeMovementData(panda$time, panda$x, panda$y, 
##D sig2obs=25.0, t.max=185.0)
##D 
##D # estimate density
##D dens.res <- initializeDensity(mkde.obj, mv.dat)
##D mkde.obj <- dens.res$mkde.obj
##D mv.dat <- dens.res$move.dat
##D mkde.rst <- mkdeToRaster(mkde.obj)
##D plot(mkde.rst)
## End(Not run)



