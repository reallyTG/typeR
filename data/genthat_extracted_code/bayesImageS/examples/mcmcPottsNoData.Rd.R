library(bayesImageS)


### Name: mcmcPottsNoData
### Title: Simulate pixel labels using chequerboard Gibbs sampling.
### Aliases: mcmcPottsNoData

### ** Examples

# Swendsen-Wang for a 2x2 lattice
neigh <- matrix(c(5,2,5,3,  1,5,5,4,  5,4,1,5,  3,5,2,5), nrow=4, ncol=4, byrow=TRUE)
blocks <- list(c(1,4), c(2,3))
res.Gibbs <- mcmcPottsNoData(0.7, 3, neigh, blocks, niter=200)
res.Gibbs$z
res.Gibbs$sum[200]



