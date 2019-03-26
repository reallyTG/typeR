library(interp)


### Name: triangles
### Title: Extract a list of triangles from a triangulation object
### Aliases: triangles
### Keywords: spatial

### ** Examples

# use the smallest Franke data set
data(franke)
fr3.tr<-tri.mesh(franke$ds3$x, franke$ds3$y)
triangles(fr3.tr)



