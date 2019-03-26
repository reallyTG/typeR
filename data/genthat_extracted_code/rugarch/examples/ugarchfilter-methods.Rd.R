library(rugarch)


### Name: ugarchfilter-methods
### Title: function: Univariate GARCH Filtering
### Aliases: ugarchfilter ugarchfilter-methods ugarchfilter,ANY-method
###   ugarchfilter,uGARCHspec-method

### ** Examples

## Not run: 
##D data(sp500ret)
##D ctrl = list(RHO = 1,DELTA = 1e-8,MAJIT = 100,MINIT = 650,TOL = 1e-6)
##D spec = ugarchspec(variance.model = list(model = "eGARCH", garchOrder = c(1,1)),
##D 		mean.model = list(armaOrder = c(1,1), include.mean = TRUE),
##D 		distribution.model = "std")
##D egarch.fit = ugarchfit(data = sp500ret[,1,drop=FALSE], spec = spec,
##D 		solver = "solnp", solver.control = ctrl)
##D 
##D spec = ugarchspec(variance.model = list(model = "eGARCH", garchOrder = c(1,1)),
##D 		mean.model = list(armaOrder = c(1,1), include.mean = TRUE),
##D 		distribution.model = "std", fixed.pars = as.list(coef(egarch.fit)))
##D egarch.filter = ugarchfilter(data = sp500ret[,1,drop=FALSE], spec = spec)
## End(Not run)


