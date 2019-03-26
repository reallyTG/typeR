library(tripack)


### Name: identify.tri
### Title: Identify points in a triangulation plot
### Aliases: identify.tri
### Keywords: spatial

### ** Examples

data(tritest)
tritest.tr<-tri.mesh(tritest$x,tritest$y)
plot(tritest.tr)
identify.tri(tritest.tr)



