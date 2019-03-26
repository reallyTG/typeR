library(geoRglm)


### Name: covariog.model.env
### Title: Envelope for Empirical Covariogram for the Poisson-log normal
###   model
### Aliases: covariog.model.env
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
data(p50)
covar <- covariog(p50, uvec = c(1:10))
parmval <- list(cov.model = "exponential", cov.pars = c(0.8,0.1), 
                beta = 1)
class(parmval) <- "covariomodel"
konvol <- covariog.model.env(p50, obj.covariog = covar, 
                             model.pars = parmval)
plot(covar, envelope.obj = konvol)
lines(parmval, max.dist = 10, lty = 1)



