library(rmgarch)


### Name: gogarchfit-methods
### Title: function: GO-GARCH Filter
### Aliases: gogarchfit gogarchfit,ANY-method gogarchfit,goGARCHspec-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = gogarchspec(mean.model = list(demean = "constant"), 
##D variance.model = list(model = "sGARCH", garchOrder = c(1,1), submodel = NULL), 
##D distribution.model = list(distribution = "manig"),ica = "fastica")
##D 
##D fit = gogarchfit(spec = spec, data  = dji30ret[,1:4, drop = FALSE], 
##D out.sample = 50, gfun = "tanh")
##D fit
## End(Not run)


