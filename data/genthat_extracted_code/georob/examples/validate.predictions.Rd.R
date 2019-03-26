library(georob)


### Name: validate.predictions
### Title: Summary Statistics of (Cross-)Validation Prediction Errors
### Aliases: validate.predictions plot.cv.georob print.cv.georob
###   summary.cv.georob print.summary.cv.georob
### Keywords: models spatial robust

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
##D summary(r.logzn.cv.1, se = TRUE)
##D summary(r.logzn.cv.2, se = TRUE)
##D 
##D op <- par(mfrow = c(2,2))
##D plot(r.logzn.cv.1, type = "lgn.sc")
##D plot(r.logzn.cv.2, type = "lgn.sc", add = TRUE, col = "red")
##D abline(0, 1, lty= "dotted")
##D plot(r.logzn.cv.1, type = "ta")
##D plot(r.logzn.cv.2, type = "ta", add = TRUE, col = "red")
##D abline(h=0, lty= "dotted")
##D plot(r.logzn.cv.2, type = "mc", add = TRUE, col = "red")
##D plot(r.logzn.cv.1, type = "bs")
##D plot(r.logzn.cv.2, type = "bs", add = TRUE, col = "red")
##D legend("topright", lty = 1, col = c("black", "red"), bty = "n",
##D     legend = c("log(Zn) ~ sqrt(dist)", "log(Zn) ~ sqrt(dist) + ffreq"))
##D par(op)
## End(Not run)



