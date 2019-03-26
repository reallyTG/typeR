library(mkde)


### Name: mkde2Dinteraction
### Title: Probability of 2D spatial-temporal interaction.
### Aliases: mkde2Dinteraction

### ** Examples

library(raster)
data(panda)
mv.dat0 <- initializeMovementData(panda$time, panda$x, panda$y, 
sig2obs=25.0, t.max=185.0)

n <- nrow(panda)
v <- 20.0 # increase from 0 to increase difference
mv.dat1 <- initializeMovementData(panda$time, panda$x+rnorm(n, 0, v), 
panda$y+rnorm(n, 0, v), sig2obs=25.0, t.max=185.0)

data(pandadem)
cell.sz <- mean(res(pandadem))
ext <- extent(pandadem)
nx <- ncol(pandadem)
ny <- nrow(pandadem)
mkde.obj <- initializeMKDE2D(ext@xmin, cell.sz, nx, ext@ymin, cell.sz,
ny)

res <- mkde2Dinteraction(mkde.obj, mv.dat0, mv.dat1, 10.0, 1e-20)
mkde.obj <- res$mkde.obj
mv.dat0 <- res$move.dat0
mv.dat1 <- res$move.dat1



