library(quadmesh)


### Name: triangmesh
### Title: Create a triangle-type mesh for use in rgl.
### Aliases: triangmesh dtriangmesh triangmesh.matrix
###   triangmesh.BasicRaster dtriangmesh.default

### ** Examples

library(raster)
r <- setExtent(raster(volcano), extent(0, nrow(volcano), 0, ncol(volcano)))
tm <- triangmesh(r)
#rgl::shade3d(tm)

## jitter the mesh just enough to show that they are distinct in the discrete case
a <- dtriangmesh(r)
a$vb[3L, ] <- jitter(a$vb[3L, ], factor = 10)
##rgl.clear(); rgl::shade3d(a, col = "grey"); aspect3d(1, 1, 0.2); rglwidget()



