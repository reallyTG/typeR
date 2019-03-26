library(rugarch)


### Name: ugarchpath-methods
### Title: function: Univariate GARCH Path Simulation
### Aliases: ugarchpath ugarchpath-methods ugarchpath,ANY-method
###   ugarchpath,uGARCHspec-method
### Keywords: methods

### ** Examples

## Not run: 
##D # create a basic sGARCH(1,1) spec:
##D spec=ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)),
##D 		mean.model=list(armaOrder=c(0,0), include.mean=TRUE, garchInMean =
##D 		FALSE, inMeanType = 2), distribution.model="sstd",
##D 		fixed.pars=list(mu=0.001,omega=0.00001, alpha1=0.05, beta1=0.90,
##D 		shape=4,skew=2))
##D # simulate the path
##D path.sgarch = ugarchpath(spec, n.sim=3000, n.start=1, m.sim=1)
## End(Not run)


