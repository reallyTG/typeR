library(rugarch)


### Name: uGARCHforecast-class
### Title: class: Univariate GARCH Forecast Class
### Aliases: uGARCHforecast-class sigma,uGARCHforecast-method
###   fitted,uGARCHforecast-method plot,uGARCHforecast,missing-method
###   show,uGARCHforecast-method fpm fpm,ANY-method
###   fpm,uGARCHforecast-method quantile,uGARCHforecast-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Basic GARCH(1,1) Spec
##D data(dmbp)
##D spec = ugarchspec()
##D fit = ugarchfit(data = dmbp[,1], spec = spec, out.sample = 100)
##D forc1 = ugarchforecast(fit, n.ahead=100, n.roll = 100)
##D forc
##D #plot(forc, which = "all")
## End(Not run)


