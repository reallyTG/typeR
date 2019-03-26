library(uniformly)


### Name: runif_in_tetrahedron
### Title: Uniform sampling in a tetrahedron
### Aliases: runif_in_tetrahedron

### ** Examples

## No test: 
library(rgl)
tetrahedron <- tetrahedron3d()
shade3d(tetrahedron, color="red", alpha=0.3)
vs <- tetrahedron$vb[1:3,]
sims <- runif_in_tetrahedron(100, vs[,1], vs[,2], vs[,3], vs[,4])
points3d(sims)
## End(No test)



