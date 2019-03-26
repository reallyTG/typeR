library(dils)


### Name: EdgelistFromAdjacency
### Title: Convert an adjacency matrix to filled edgelist.
### Aliases: EdgelistFromAdjacency

### ** Examples

n <- 10
A <- matrix(rnorm(n*n), nrow=n)
A
EdgelistFromAdjacency(A)

n <- 100
A <- matrix(rnorm(n*n), nrow=n)
A
EdgelistFromAdjacency(A)

n <- 500
A <- matrix(rnorm(n*n), nrow=n)
A
## Not run: EdgelistFromAdjacency(A)



