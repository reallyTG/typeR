library(bayesImageS)


### Name: swNoData
### Title: Simulate pixel labels using the Swendsen-Wang algorithm.
### Aliases: swNoData

### ** Examples

# Swendsen-Wang for a 2x2 lattice
neigh <- matrix(c(5,2,5,3,  1,5,5,4,  5,4,1,5,  3,5,2,5), nrow=4, ncol=4, byrow=TRUE)
blocks <- list(c(1,4), c(2,3))
res.sw <- swNoData(0.7, 3, neigh, blocks, niter=200)
res.sw$z
res.sw$sum[200]



