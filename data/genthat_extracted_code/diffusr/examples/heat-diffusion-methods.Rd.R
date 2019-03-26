library(diffusr)


### Name: heat.diffusion
### Title: Graph diffusion using a heat diffusion process on a Laplacian
###   matrix.
### Aliases: heat.diffusion heat.diffusion,numeric,matrix-method
###   heat.diffusion,matrix,matrix-method

### ** Examples

# count of nodes
n <- 5
# starting distribution (has to sum to one)
h0 <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
# adjacency matrix (either normalized or not)
graph <- matrix(abs(rnorm(n*n)), n, n)
# computation of stationary distribution
ht <- heat.diffusion(h0, graph)



