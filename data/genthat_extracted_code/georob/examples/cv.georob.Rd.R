library(georob)


### Name: cv.georob
### Title: Cross-Validating a Spatial Linear Model Fitted by 'georob'
### Aliases: cv.georob
### Keywords: models spatial

### ** Examples

## Not run: 
##D data(meuse)
##D 
##D r.logzn <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1)
##D 
##D r.logzn.cv.1 <- cv(r.logzn, seed = 1, lgn = TRUE)
##D r.logzn.cv.2 <- cv(r.logzn, formula = .~. + ffreq, seed = 1, lgn = TRUE)
##D 
##D plot(r.logzn.cv.1, type = "bs")
##D plot(r.logzn.cv.2, type = "bs", add = TRUE, col = "red")
##D 
##D legend("topright", lty = 1, col = c("black", "red"), bty = "n",
##D     legend = c("log(Zn) ~ sqrt(dist)", "log(Zn) ~ sqrt(dist) + ffreq"))
## End(Not run)



