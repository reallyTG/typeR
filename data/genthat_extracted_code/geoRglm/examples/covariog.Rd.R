library(geoRglm)


### Name: covariog
### Title: Empirical Covariogram for a Model with log-link and an
###   Underlying Gaussian Field
### Aliases: covariog
### Keywords: spatial

### ** Examples

data(p50)
covar <- covariog(p50, uvec=c(1:10))
plot(covar)
## Now excluding the bin at zero (only assuming log-link).
covar2 <- covariog(p50,uvec=c(1:10), estimator.type="no")
plot(covar2)



