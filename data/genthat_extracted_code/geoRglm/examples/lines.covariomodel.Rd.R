library(geoRglm)


### Name: lines.covariomodel
### Title: Line with a Covariogram Model
### Aliases: lines.covariomodel
### Keywords: spatial aplot

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
sim <- grf(100, cov.pars = c(0.1, 0.2))
sim$data <- rpois(100, lambda = exp(sim$data+1))
# data generated from the poisson-log normal model
covario <- covariog(sim, max.dist = 1)  # sample covariogram
plot(covario)                      
parmval <- list(cov.model = "exponential", cov.pars = c(0.1, 0.1), 
                max.dist = 1, nugget = 0.01)
class(parmval) <- "covariomodel"
lines(parmval, lty = 2)



