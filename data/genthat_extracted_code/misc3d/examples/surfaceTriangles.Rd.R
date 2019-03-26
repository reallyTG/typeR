library(misc3d)


### Name: surfaceTriangles
### Title: Create a Triangle Mesh Representing a Surface
### Aliases: surfaceTriangles
### Keywords: hplot

### ** Examples

  drawScene(surfaceTriangles(seq(-1,1,len=30), seq(-1,1,len=30),
                             function(x, y) (x^2 + y^2), color2 = "green"))
  drawScene.rgl(surfaceTriangles(seq(-1,1,len=30), seq(-1,1,len=30),
                             function(x, y) (x^2 + y^2), color2 = "green"))



