library(rugarch)


### Name: ugarchroll-methods
### Title: function: Univariate GARCH Rolling Density Forecast and
###   Backtesting
### Aliases: ugarchroll ugarchroll-methods ugarchroll,ANY-method
###   ugarchroll,uGARCHspec-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(sp500ret)
##D spec = ugarchspec(distribution.model = "std")
##D mod = ugarchroll(spec, data = sp500ret, n.ahead = 1, 
##D n.start = 1000,  refit.every = 500, refit.window = "recursive", 
##D solver = "hybrid", fit.control = list(),
##D calculate.VaR = TRUE, VaR.alpha = c(0.01, 0.025, 0.05),
##D keep.coef = TRUE)
##D report(mod, type="VaR", VaR.alpha = 0.01, conf.level = 0.95) 
##D report(mod, type="fpm")
## End(Not run)


