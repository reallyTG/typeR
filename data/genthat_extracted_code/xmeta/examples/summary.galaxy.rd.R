library(xmeta)


### Name: summary.galaxy
### Title: Summarize the objects 'galaxy'
### Aliases: summary.galaxy
### Keywords: summary

### ** Examples

data(prostate)
fit.galaxy=galaxy(data=prostate, type = "continuous",
 method="galaxy.cl", k=2, L=1, estimator="R0", maxiter=150)
summary(fit.galaxy)



