library(interp)


### Name: tri.mesh
### Title: Delaunay triangulation
### Aliases: tri.mesh
### Keywords: spatial

### ** Examples

## use Frankes datasets:
data(franke)
tr1 <- tri.mesh(franke$ds3$x, franke$ds3$y)
tr1
tr2 <- tri.mesh(franke$ds2)
summary(tr2)



