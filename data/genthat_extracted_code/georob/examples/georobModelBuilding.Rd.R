library(georob)


### Name: georobModelBuilding
### Title: S3 Methods for Stepwise Building Fixed-Effects Models for Class
###   'georob'
### Aliases: georobModelBuilding add1.georob deviance.georob drop1.georob
###   extractAIC.georob logLik.georob step step.default step.georob
###   waldtest waldtest.georob
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D   
##D data(meuse)
##D 
##D ## Gaussian REML fit
##D r.logzn.reml <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1000)
##D summary(r.logzn.reml, correlation = TRUE)
##D 
##D deviance(r.logzn.reml)
##D logLik(r.logzn.reml)
##D 
##D waldtest(r.logzn.reml, .~. + ffreq)
##D 
##D step(r.logzn.reml, ~ sqrt(dist) + ffreq + soil)
##D 
##D ## robust REML fit 
##D r.logzn.rob <- update(r.logzn.reml, tuning.psi = 1)
##D 
##D deviance(r.logzn.rob)
##D logLik(r.logzn.rob)
##D logLik(r.logzn.rob, REML=TRUE)
##D 
##D step(r.logzn.rob, ~ sqrt(dist) + ffreq + soil, fixed.step=FALSE, trace=2)
## End(Not run)



