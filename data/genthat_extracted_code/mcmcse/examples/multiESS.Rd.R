library(mcmcse)


### Name: multiESS
### Title: Effective Sample Size of a multivariate Markov chain as
###   described in Vats et al. (2015).
### Aliases: multiESS

### ** Examples

library(mAr)
p <- 3
n <- 1e3
omega <- 5*diag(1,p)

## Making correlation matrix var(1) model
set.seed(100)
foo <- matrix(rnorm(p^2), nrow = p)
foo <- foo %*% t(foo)
phi <- foo / (max(eigen(foo)$values) + 1)
  
out <- as.matrix(mAr.sim(rep(0,p), phi, omega, N = n))

multiESS(out)



