library(mkde)


### Name: mkde3Dgrid
### Title: Movement-based kernel density estimate (MKDE) in 3D using Rcpp
### Aliases: mkde3Dgrid

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
nz <- ceiling(3000.0/cell.sz)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, 0.0, cell.sz, nz)

res <- mkde3Dgrid(mkde.obj, mv.dat, 5.0, 1e-20)



