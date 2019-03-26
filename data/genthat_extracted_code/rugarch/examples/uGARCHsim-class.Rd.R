library(rugarch)


### Name: uGARCHsim-class
### Title: class: Univariate GARCH Simulation Class
### Aliases: uGARCHsim-class sigma,uGARCHsim-method fitted,uGARCHsim-method
###   quantile,uGARCHsim-method plot,uGARCHsim,missing-method
###   show,uGARCHsim-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Basic GARCH(1,1) Spec
##D data(dmbp)
##D spec = ugarchspec()
##D fit = ugarchfit(data = dmbp[,1], spec = spec)
##D sim = ugarchsim(fit,n.sim=1000, n.start=1, m.sim=1, startMethod="sample")
##D sim
##D head(sigma(sim))
## End(Not run)


