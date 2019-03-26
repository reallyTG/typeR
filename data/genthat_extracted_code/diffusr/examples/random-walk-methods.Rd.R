library(diffusr)


### Name: random.walk
### Title: Graph diffusion using a Markov random walk
### Aliases: random.walk random.walk,numeric,matrix-method
###   random.walk,matrix,matrix-method

### ** Examples

 # count of nodes
 n <- 5
 # starting distribution (has to sum to one)
 p0    <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
 # adjacency matrix (either normalized or not)
 graph <- matrix(abs(rnorm(n*n)), n, n)
 # computation of stationary distribution
 pt    <- random.walk(p0, graph)




