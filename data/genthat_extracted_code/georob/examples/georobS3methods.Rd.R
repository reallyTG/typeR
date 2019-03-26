library(georob)


### Name: georobS3methods
### Title: Common S3 Methods for Class 'georob'
### Aliases: georobS3methods georobMethods coef.georob fixed.effects
###   fixed.effects.georob fixef fixef.georob model.frame.georob
###   model.matrix.georob nobs.georob print.coef.georob print.georob
###   print.summary.georob random.effects random.effects.georob ranef
###   ranef.georob resid.georob residuals.georob rstandard.georob
###   summary.georob vcov.georob
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
##D ## robust REML fit 
##D r.logzn.rob <- update(r.logzn.reml, tuning.psi = 1)
##D     
##D summary(r.logzn.rob, correlation = TRUE)
##D 
##D ## residual diagnostics
##D old.par <- par(mfrow = c(2,3))
##D 
##D plot(fitted(r.logzn.reml), rstandard(r.logzn.reml))
##D abline(h = 0, lty = "dotted")
##D qqnorm(rstandard(r.logzn.reml))
##D abline(0, 1)
##D qqnorm(ranef(r.logzn.reml, standard = TRUE))
##D abline(0, 1)
##D plot(fitted(r.logzn.rob), rstandard(r.logzn.rob))
##D abline(h = 0, lty = "dotted")
##D qqnorm(rstandard(r.logzn.rob))
##D abline(0, 1)
##D qqnorm(ranef(r.logzn.rob, standard = TRUE))
##D abline(0, 1)
##D 
##D par(old.par)
## End(Not run)



