library(mcmcse)


### Name: confRegion
### Title: Confidence regions (ellipses) for Monte Carlo estimates
### Aliases: confRegion

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
mcerror <- mcse.multi(out)

## Plotting the ellipse
plot(confRegion(mcerror), type = 'l')



