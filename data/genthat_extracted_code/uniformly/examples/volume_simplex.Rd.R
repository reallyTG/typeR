library(uniformly)


### Name: volume_simplex
### Title: Simplex volume
### Aliases: volume_simplex

### ** Examples

set.seed(666)
simplex <- matrix(rnorm(4*3), nrow=4, ncol=3)
volume_simplex(simplex)
volume_tetrahedron(simplex[1,], simplex[2,], simplex[3,], simplex[4,])



