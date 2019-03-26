library(surveillance)


### Name: nbOrder
### Title: Determine Neighbourhood Order Matrix from Binary Adjacency
###   Matrix
### Aliases: nbOrder
### Keywords: spatial utilities

### ** Examples

## generate adjacency matrix
set.seed(1)
n <- 6
adjmat <- matrix(0, n, n)
adjmat[lower.tri(adjmat)] <- sample(0:1, n*(n-1)/2, replace=TRUE)
adjmat <- adjmat + t(adjmat)
adjmat

## determine neighbourhood order matrix
if (requireNamespace("spdep")) {
    nbmat <- nbOrder(adjmat, maxlag=Inf)
    nbmat
}



