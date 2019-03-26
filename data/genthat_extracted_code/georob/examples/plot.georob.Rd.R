library(georob)


### Name: plot.georob
### Title: Plot Methods for Class 'georob'
### Aliases: plot.georob lines.georob
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D ################
##D ## meuse data ##
##D ################
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
##D plot(r.logzn.reml, lag.dist.def = seq(0, 2000, by = 100))
##D lines(r.logzn.rob, col = "red")
## End(Not run)



