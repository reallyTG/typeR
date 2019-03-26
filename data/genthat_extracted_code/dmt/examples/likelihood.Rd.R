library(dmt)


### Name: pfa.neg.log.likelihood
### Title: Likelihood for the models.
### Aliases: pfa.neg.log.likelihood
### Keywords: utilities

### ** Examples

library(dmt)
# Generate toydata
N <- 100
xdim <- 10
zdim <- 3
toy <- generate.toydata(N = N, zDim = zdim, xDim = xdim, yDim = xdim, 
               marginal.covariances = "diagonal")
# Estimate model parameters
res <- pfa(toy$X, zDimension = zdim)
W <- res@W$total
phi <- res@phi$total
# wtw <- crossprod(t(W)) # is the same as W * t(W)
# Calculate negative log-likelihood for the model
L <- pfa.neg.log.likelihood(W, phi,toy$X)



