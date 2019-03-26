library(rma.exact)


### Name: rma.exact.fast
### Title: Compute a confidence interval for the grand mean at a
###   user-specified confidence level.
### Aliases: rma.exact.fast

### ** Examples


K <- 5
c0 <- 1
mu0 <- 0
tau2 <- 12.5
vi <- (seq(1, 5, length=K))^2
yi=rnorm(K)*sqrt(vi+tau2)+mu0
rma.exact.fast(yi=yi,vi=vi,level=.05)



