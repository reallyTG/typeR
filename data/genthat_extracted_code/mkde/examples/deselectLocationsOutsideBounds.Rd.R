library(mkde)


### Name: deselectLocationsOutsideBounds
### Title: Flag 3D locations with out-of-bounds z-coordinates
### Aliases: deselectLocationsOutsideBounds

### ** Examples

library(raster)
data(condor)
mv.dat <- initializeMovementData(condor$time, condor$x, condor$y, 
z.obs=condor$z, sig2obs=25.0, sig2obs.z=81.0, t.max=65.0)

data(condordem)
cell.sz <- mean(res(condordem))
ext <- extent(condordem)
nx <- ncol(condordem)
ny <- nrow(condordem)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(condordem), na.rm=TRUE), 30.0, 100)
mkde.obj <- setMinimumZfromRaster(mkde.obj, condordem)
mv.dat <- deselectLocationsOutsideBounds(mv.dat, mkde.obj)



