library(rmgarch)


### Name: gogarchforecast-methods
### Title: function: GO-GARCH Forecast
### Aliases: gogarchforecast gogarchforecast-methods
###   gogarchforecast,ANY-method gogarchforecast,goGARCHfit-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = gogarchspec()
##D fit = gogarchfit(spec = spec, data = dji30ret[,1:4], out.sample = 10, 
##D gfun = "tanh")
##D forecast = gogarchforecast(fit, n.ahead = 1, n.roll = 9)
## End(Not run)


