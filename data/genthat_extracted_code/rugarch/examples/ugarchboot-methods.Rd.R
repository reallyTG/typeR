library(rugarch)


### Name: ugarchboot-methods
### Title: function: Univariate GARCH Forecast via Bootstrap
### Aliases: ugarchboot ugarchboot-methods ugarchboot,ANY-method
###   ugarchboot,uGARCHfit-method ugarchboot,uGARCHspec-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec(variance.model=list(model="gjrGARCH", garchOrder=c(1,1)), 
##D 		mean.model=list(armaOrder=c(1,1), arfima=FALSE, include.mean=TRUE, 
##D 		archm = FALSE, archpow = 1), distribution.model="std")
##D ctrl = list(tol = 1e-7, delta = 1e-9)
##D fit = ugarchfit(data=dji30ret[, "BA", drop = FALSE], out.sample = 0, 
##D 				spec = spec, solver = "solnp", solver.control = ctrl,
##D 				fit.control = list(scale = 1))
##D bootpred = ugarchboot(fit, method = "Partial", n.ahead = 120, n.bootpred = 2000)
##D bootpred
##D # as.data.frame(bootpred, which = "sigma", type = "q", qtile = c(0.01, 0.05))
## End(Not run)


