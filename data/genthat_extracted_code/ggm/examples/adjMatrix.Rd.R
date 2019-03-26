library(ggm)


### Name: adjMatrix
### Title: Adjacency matrix of a graph
### Aliases: adjMatrix
### Keywords: array algebra graphs multivariate

### ** Examples

amat <- DAG(y ~ x+z, z~u+v)
E <- edgematrix(amat)
adjMatrix(E)



