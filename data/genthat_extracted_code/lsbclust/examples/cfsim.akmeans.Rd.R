library(lsbclust)


### Name: cfsim.akmeans
### Title: Compare LSBCLUST Simulation Results
### Aliases: cfsim.akmeans

### ** Examples

## Simulate LSBCLUST data, fit akmeans on double-centered data, and compare
set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5))
dat[[1]]$data <- carray(dat[[1]]$data)
res <- akmeans(data = dat[[1]]$data, centers = 5, margin = 3, ndim = 2)
cfsim(res, dat[[1]])



