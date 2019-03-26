library(rgl)


### Name: addNormals
### Title: Add normal vectors to objects so they render more smoothly.
### Aliases: addNormals addNormals.mesh3d addNormals.shapelist3d
### Keywords: dynamic

### ** Examples

open3d()
y <- subdivision3d(tetrahedron3d(col = "red"), depth = 3)
shade3d(y) # No normals
y <- addNormals(y)
shade3d(translate3d(y, x = 1, y = 0, z = 0)) # With normals



