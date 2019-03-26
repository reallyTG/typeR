library(lsbclust)


### Name: cfsim.lsbclust
### Title: Compare LSBCLUST Simulation Results
### Aliases: cfsim.lsbclust

### ** Examples

## Simulate LSBCLUST data, fit LSBCLUST, and compare
set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5))
res <- lsbclust(data = dat[[1]]$data, nclust = c(5, 4, 6, 5))
cfsim(res, dat[[1]])



