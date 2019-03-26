library(spatstat)


### Name: vertices
### Title: Vertices of a Window
### Aliases: vertices vertices.owin
### Keywords: spatial math

### ** Examples

  data(letterR)
  vert <- vertices(letterR)

  plot(letterR, main="Polygonal vertices")
  points(vert)
  plot(letterR, main="Boundary pixels")
  points(vertices(as.mask(letterR)))



