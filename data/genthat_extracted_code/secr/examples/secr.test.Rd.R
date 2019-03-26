library(secr)


### Name: secr.test
### Title: Goodness-of-Fit Test
### Aliases: secr.test
### Keywords: htest

### ** Examples


## Not run: 
##D 
##D secr.test(secrdemo.0, nsim = 99)
##D 
##D secr.test(ovenbird.model.1, nsim = 20)
##D 
##D ## example combining raw data summary and model fit
##D ## assumes single-session
##D bothfn <- function(object) {
##D     CH <- object$capthist
##D     f1 <- sum(apply(abs(CH) > 0, 1, sum) == 1) / nrow(CH)
##D     devdf <- deviance(object) / df.residual(object)
##D     c(f1 = f1, devdf = devdf)
##D }
##D test <- secr.test (secrdemo.0, nsim = 19, statfn = bothfn, fit = TRUE)
##D test
##D plot(test, main = '')
## End(Not run)




