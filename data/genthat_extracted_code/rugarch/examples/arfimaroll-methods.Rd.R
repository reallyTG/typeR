library(rugarch)


### Name: arfimaroll-methods
### Title: function: ARFIMA Rolling Density Forecast and Backtesting
### Aliases: arfimaroll-methods arfimaroll,ANY-method
###   arfimaroll,ARFIMAspec-method arfimaroll
### Keywords: methods

### ** Examples

## Not run: 
##D data(sp500ret)
##D spec = arfimaspec(distribution.model = "std")
##D mod = arfimaroll(spec, data = sp500ret, n.ahead = 1, 
##D n.start = 1000,  refit.every = 100, refit.window = "moving", 
##D solver = "hybrid", fit.control = list(),
##D calculate.VaR = TRUE, VaR.alpha = c(0.01, 0.025, 0.05),
##D keep.coef = TRUE)
##D report(sp500.bktest, type="VaR", VaR.alpha = 0.01, conf.level = 0.95) 
##D report(sp500.bktest, type="fpm")
## End(Not run)


