library(mombf)


### Name: nlpmarginals
### Title: Marginal density of the observed data for linear regression with
###   Normal, two-piece Normal, Laplace or two-piece Laplace residuals
###   under non-local and Zellner priors
### Aliases: nlpmarginals nlpMarginal pimomMarginalK pimomMarginalU
###   pmomMarginalK pmomMarginalU
### Keywords: models htest

### ** Examples

x <- matrix(rnorm(100*2),ncol=2)
y <- x %*% matrix(c(.5,1),ncol=1) + rnorm(nrow(x))
pmomMarginalK(sel=1, y=y, x=x, phi=1, tau=1, method='Laplace')
pmomMarginalK(sel=1:2, y=y, x=x, phi=1, tau=1, method='Laplace')



