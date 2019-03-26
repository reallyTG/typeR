library(igraph)


### Name: sample_dot_product
### Title: Generate random graphs according to the random dot product graph
###   model
### Aliases: sample_dot_product dot_product
### Keywords: graphs

### ** Examples


## A randomly generated  graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
g <- sample_dot_product(lpvs)
g

## Sample latent vectors from the surface of the unit sphere
lpvs2 <- sample_sphere_surface(dim=5, n=20)
g2 <- sample_dot_product(lpvs2)
g2



