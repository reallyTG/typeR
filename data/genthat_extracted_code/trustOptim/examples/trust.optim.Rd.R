library(trustOptim)


### Name: trust.optim
### Title: Nonlinear optimizers using trust regions.
### Aliases: trust.optim

### ** Examples

## Not run: 
##D data(binary)
##D N <- length(binary$Y)
##D k <- NROW(binary$X)
##D start <- rep(0,(N+1)*k)
##D priors <- list(inv.Sigma = diag(k), inv.Omega = diag(k))
##D opt <- trust.optim(start, fn=binary.f,
##D                   gr = binary.grad,  
##D                   hs = binary.hess,
##D                   method = "Sparse",
##D                   control = list(
##D                       report.precision=1L,
##D                       function.scale.factor=-1
##D                   ),
##D                   data=binary, priors=priors
##D                   )
## End(Not run)




