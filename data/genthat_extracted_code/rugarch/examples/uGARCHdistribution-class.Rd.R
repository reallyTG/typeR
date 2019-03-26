library(rugarch)


### Name: uGARCHdistribution-class
### Title: class: Univariate GARCH Parameter Distribution Class
### Aliases: uGARCHdistribution-class
###   as.data.frame,uGARCHdistribution-method
###   plot,uGARCHdistribution,missing-method show,uGARCHdistribution-method
### Keywords: classes

### ** Examples

## Not run: 
##D data(sp500ret)
##D spec = ugarchspec(variance.model=list(model="gjrGARCH", garchOrder=c(1,1)), 
##D 		mean.model=list(armaOrder=c(1,1), arfima=FALSE, include.mean=TRUE, 
##D 		archm = FALSE, archpow = 1), distribution.model="std")
##D 		
##D fit = ugarchfit(data=sp500ret[, 1, drop = FALSE], out.sample = 0, 
##D 				spec = spec, solver = "solnp")
##D 	
##D dist = ugarchdistribution(fit, n.sim = 2000, n.start = 50, m.sim = 5)
## End(Not run)


