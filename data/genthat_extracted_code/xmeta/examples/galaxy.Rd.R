library(xmeta)


### Name: galaxy
### Title: Correcting for publication bias of multivariate meta-analysis
### Aliases: galaxy
### Keywords: Multivariate meta-analysis Publication bias Galaxy method

### ** Examples

data(prostate)
fit.galaxy=galaxy(data=prostate, type = "continuous",
  method="galaxy.cl", k=2, L=1, estimator="R0", maxiter=150)
summary(fit.galaxy)



