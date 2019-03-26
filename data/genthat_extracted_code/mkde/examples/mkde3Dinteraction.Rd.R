library(mkde)


### Name: mkde3Dinteraction
### Title: Probability of 3D spatial-temporal interaction.
### Aliases: mkde3Dinteraction

### ** Examples

library(raster)
data(condor)
condor <- condor[1:4,] # simply to make example run more quickly
mv.dat0 <- initializeMovementData(condor$time, condor$x, condor$y, 
z.obs=condor$z, sig2obs=25.0, sig2obs.z=81.0, t.max=65.0)
n <- nrow(condor)
v <- 20.0 # increase from 0 to increase difference between move trajectories
vz <- 5.0
mv.dat1 <- initializeMovementData(condor$time, condor$x+rnorm(n, 0, v), 
condor$y+rnorm(n, 0, v), z.obs=condor$z+rnorm(n, 0, vz), sig2obs=25.0, 
sig2obs.z=81.0, t.max=65.0)

data(condordem120)
# next two lines reduce extent of 2D space to speed execution of example
tmp <- extent(c(range(condor$x) + c(-100, 100), range(condor$y) + c(-100, 100)))
condordem120 <- crop(condordem120, tmp)
cell.sz <- mean(res(condordem120))
ext <- extent(condordem120)
nx <- ncol(condordem120)
ny <- nrow(condordem120)
nz <- ceiling(3000.0/cell.sz)
mkde.obj <- initializeMKDE3D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny, 0.0, cell.sz, nz)

res <- mkde3Dinteraction(mkde.obj, mv.dat0, mv.dat1, 10.0, 1e-20)
mkde.obj <- res$mkde.obj
mv.dat0 <- res$move.dat0
mv.dat1 <- res$move.dat1



