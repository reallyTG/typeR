library(rugarch)


### Name: uGARCHfilter-class
### Title: class: Univariate GARCH Filter Class
### Aliases: uGARCHfilter-class coef,uGARCHfilter-method
###   fitted,uGARCHfilter-method likelihood,uGARCHfilter-method
###   infocriteria,uGARCHfilter-method newsimpact,uGARCHfilter-method
###   signbias,uGARCHfilter-method gof,uGARCHfilter,numeric-method
###   persistence,uGARCHfilter,missing,missing,missing,missing-method
###   halflife,uGARCHfilter,missing,missing,missing,missing-method
###   plot,uGARCHfilter,missing-method residuals,uGARCHfilter-method
###   sigma,uGARCHfilter-method uncmean,uGARCHfilter-method
###   quantile,uGARCHfilter-method pit,uGARCHfilter-method
###   uncvariance,uGARCHfilter,missing,missing,missing,missing,missing-method
###   show,uGARCHfilter-method
### Keywords: classes

### ** Examples

## Not run: 
##D data(dji30ret)
##D ctrl = list(rho = 1, delta = 1e-8, outer.iter = 100, inner.iter = 650, 
##D tol = 1e-6)
##D spec = ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)), 
##D 		mean.model = list(armaOrder = c(1,1), include.mean = TRUE), 
##D 		distribution.model = "std")
##D sgarch.fit = ugarchfit(data = dji30ret[,"AA",drop=FALSE], spec = spec, 
##D 		solver = "solnp", solver.control = ctrl)
##D 		
##D spec = ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)), 
##D 		mean.model = list(armaOrder = c(1,1), include.mean = TRUE), 
##D 		distribution.model = "std", fixed.pars = as.list(coef(sgarch.fit)))
##D sgarch.filter = ugarchfilter(data = dji30ret[,"AA",drop=FALSE], spec = spec)
##D 
##D c(likelihood(sgarch.filter), likelihood(sgarch.fit))
##D c(uncmean(sgarch.filter), uncmean(sgarch.fit))
##D c(uncvariance(sgarch.filter), uncvariance(sgarch.fit))
## End(Not run)


