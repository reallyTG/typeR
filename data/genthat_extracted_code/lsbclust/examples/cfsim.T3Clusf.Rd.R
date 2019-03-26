library(lsbclust)


### Name: cfsim.T3Clusf
### Title: Compare LSBCLUST Simulation Results
### Aliases: cfsim.T3Clusf

### ** Examples

## Simulate LSBCLUST data, fit T3Clusf on double-centered data, and compare
set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5))
dat[[1]]$data <- carray(dat[[1]]$data)
res <- T3Clusf(X = dat[[1]]$data, Q = 2, G = 5)
cfsim(res, dat[[1]])



