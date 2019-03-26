library(ggm)


### Name: edgematrix
### Title: Edge matrix of a graph
### Aliases: edgematrix
### Keywords: array algebra graphs multivariate

### ** Examples

amat <- DAG(y ~ x+z, z~u+v)
amat
edgematrix(amat)
edgematrix(amat, inv=TRUE)



