library(quadmesh)


### Name: quadmesh
### Title: Create a quad-type mesh for use in rgl.
### Aliases: quadmesh dquadmesh dquadmesh.default quadmesh.BasicRaster
###   quadmesh.matrix

### ** Examples

library(raster)
data(volcano)
r <- setExtent(raster(volcano), extent(0, 100, 0, 200))
qm <- quadmesh(r)



