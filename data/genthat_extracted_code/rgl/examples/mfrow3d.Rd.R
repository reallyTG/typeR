library(rgl)


### Name: mfrow3d
### Title: Set up multiple figure layouts in rgl.
### Aliases: mfrow3d layout3d next3d subsceneList clearSubsceneList
### Keywords: graphics

### ** Examples

shapes <- list(Tetrahedron = tetrahedron3d(), Cube = cube3d(), Octahedron = octahedron3d(),
               Icosahedron = icosahedron3d(), Dodecahedron = dodecahedron3d(),
               Cuboctahedron = cuboctahedron3d())
col <- rainbow(6)
open3d()
mfrow3d(3, 2)
for (i in 1:6) {
  next3d()   # won't advance the first time, since it is empty
  shade3d(shapes[[i]], col = col[i])
}
highlevel(integer()) # To trigger display as rglwidget

open3d()
mat <- matrix(1:4, 2, 2)
mat <- rbind(mat, mat + 4, mat + 8)
layout3d(mat, height = rep(c(3, 1), 3), sharedMouse = TRUE)
for (i in 1:6) {
  next3d()
  shade3d(shapes[[i]], col = col[i])
  next3d()
  text3d(0, 0, 0, names(shapes)[i])
}
highlevel(integer())



