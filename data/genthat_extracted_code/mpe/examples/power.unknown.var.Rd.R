library(mpe)


### Name: power.unknown.var
### Title: Multiple Co-Primary Endpoints with Unknown Covariance
### Aliases: power.unknown.var
### Keywords: htest multivariate

### ** Examples

## compute power
## Not run: 
##D power.unknown.var(K = 2, n = 20, delta = c(1,1), Sigma = diag(c(1,1)))
##D 
##D ## To compute sample size, first assume covariance as known
##D power.known.var(K = 2, delta = c(1,1), Sigma = diag(c(2,2)), power = 0.9,
##D                   sig.level = 0.025)
##D 
##D ## The value of n, which is 51, is used as min.n and max.n must be larger
##D ## then min.n so we try 60.
##D power.unknown.var(K = 2, delta = c(1,1), Sigma = diag(c(2,2)), power = 0.9,
##D                   sig.level = 0.025, min.n = 51, max.n = 60)
##D 
##D ## More complex example with unknown covariance matrix assumed to be
##D Sigma <- matrix(c(1.440, 0.840, 1.296, 0.840,
##D                   0.840, 1.960, 0.168, 1.568,
##D                   1.296, 0.168, 1.440, 0.420,
##D                   0.840, 1.568, 0.420, 1.960), ncol = 4)
##D ## compute power
##D power.unknown.var(K = 4, n = 90, delta = c(0.5, 0.75, 0.5, 0.75), Sigma = Sigma)
##D ## equivalent: unknown SDs and correlation rho
##D power.unknown.var(K = 4, n = 90, delta = c(0.5, 0.75, 0.5, 0.75),
##D                   SD = c(1.2, 1.4, 1.2, 1.4),
##D                   rho = c(0.5, 0.9, 0.5, 0.1, 0.8, 0.25))
## End(Not run)


