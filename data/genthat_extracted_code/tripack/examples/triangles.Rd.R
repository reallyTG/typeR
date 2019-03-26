library(tripack)


### Name: triangles
### Title: Extract a list of triangles from a triangulation object
### Aliases: triangles
### Keywords: spatial

### ** Examples

# use a slighlty modified version of data(tritest)
data(tritest2)
tritest2.tr<-tri.mesh(tritest2$x,tritest2$y)
triangles(tritest2.tr)



