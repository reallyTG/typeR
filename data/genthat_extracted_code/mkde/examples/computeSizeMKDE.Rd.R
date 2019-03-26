library(mkde)


### Name: computeSizeMKDE
### Title: Compute the area or volume of an MKDE.
### Aliases: computeSizeMKDE

### ** Examples

library(raster)
data(condor)
condor <- condor[1:10,] # simply to make example run more quickly
mv.dat <- initializeMovementData(condor$time, condor$x, condor$y, 
z.obs=condor$z, sig2obs=25.0, sig2obs.z=81.0, t.max=65.0)

data(condordem120)
cell.sz <- mean(res(condordem120))
ext <- extent(condordem120)
nx <- ncol(condordem120)
ny <- nrow(condordem120)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, min(values(condordem120), na.rm=TRUE), cell.sz, 25)

# note: we use a raster coarse integration time step so the
# example runs faster
dens.res <- initializeDensity(mkde.obj, mv.dat, integration.step=10.0)
mkde.obj <- dens.res$mkde.obj
mv.dat <- dens.res$move.dat

my.quantiles <- c(0.95, 0.75, 0.50)
res <- computeContourValues(mkde.obj, my.quantiles)
res$volume <- computeSizeMKDE(mkde.obj, my.quantiles)
print(res)



