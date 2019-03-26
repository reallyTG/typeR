library(uniformly)


### Name: runif_ellipsoid
### Title: Uniform sampling on/in ellipsoid
### Aliases: runif_ellipsoid runif_on_ellipsoid runif_in_ellipsoid

### ** Examples

A <- rbind(c(2,1),c(1,1))
r <- 2
sims <- runif_on_ellipsoid(30, A, r)
plot(sims, xlim=c(-2,2), ylim=c(-3,3), asp=1, pch=19)
sims <- runif_in_ellipsoid(100, A, r)
plot(sims, xlim=c(-2,2), ylim=c(-3,3), asp=1, pch=19)
## No test: 
# 3D example
A <- matrix(c(5,1,1, 1,3,1, 1,1,1), ncol=3)
r <- 2
# draw the ellipsoid
library(misc3d)
x <- seq(-1, 1, len=50)
y <- seq(-1.5, 1.5, len=50)
z <- seq(-2.7, 2.7, len=50)
g <- as.matrix(expand.grid(x=x, y=y, z=z))
voxel <- array(apply(g, 1, function(v) t(v) %*% A %*% v), dim=c(50,50,50))
isosurface <- computeContour3d(voxel, max(voxel), r^2, x=x, y=y, z=z)
drawScene.rgl(makeTriangles(isosurface, alpha=0.3))
# simulate and plot points on ellispoid
library(rgl)
sims <- runif_on_ellipsoid(200, A, r)
points3d(sims)
## End(No test)



