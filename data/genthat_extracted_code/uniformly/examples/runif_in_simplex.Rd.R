library(uniformly)


### Name: runif_in_simplex
### Title: Uniform sampling in a simplex
### Aliases: runif_in_simplex

### ** Examples

simplex <- rbind(c(0,0,0), c(1,0,0), c(1,1,0), c(1,1,2))
sims <- runif_in_simplex(1000, simplex)
## No test: 
library(rgl)
points3d(sims)
## End(No test)



