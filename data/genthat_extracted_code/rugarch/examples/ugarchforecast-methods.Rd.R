library(rugarch)


### Name: ugarchforecast-methods
### Title: function: Univariate GARCH Forecasting
### Aliases: ugarchforecast ugarchforecast-methods
###   ugarchforecast,ANY-method ugarchforecast,uGARCHfit-method
###   ugarchforecast,uGARCHspec-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Basic GARCH(1,1) Spec
##D data(dmbp)
##D spec = ugarchspec()
##D fit = ugarchfit(data = dmbp[,1], spec = spec)
##D forc = ugarchforecast(fit, n.ahead=20)
##D forc
##D head(sigma(forc))
##D head(fitted(forc))
##D #plot(forc,which="all")
## End(Not run)


