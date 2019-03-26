library(constrainedKriging)


### Name: covmodel
### Title: Create isotropic covariance model
### Aliases: covmodel covmodellist print.covmodel
### Keywords: models

### ** Examples

## Not run: 
##D # table with all available covariance models and their
##D # parameters
##D covmodel()
##D 
##D # exponential model without a measurement error and without a nugget,
##D # partial sill = 10, scale  parameter = 15
##D covmodel(modelname = "exponential", variance = 10, scale = 15)
##D 
##D # exponential model with a measurement error ( mev = 0.5) and a
##D # nugget (nugget = 2.1), exponential partial  sill (variance = 10)
##D # and scale parameter = 15
##D covmodel(modelname = "exponential", mev  = 0.5, nugget = 2.1,
##D variance = 10, scale = 15)
## End(Not run)



