library(rmgarch)


### Name: gogarchfilter-methods
### Title: function: GO-GARCH Filter
### Aliases: gogarchfilter gogarchfilter,ANY-method
###   gogarchfilter,goGARCHfit-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = gogarchspec()
##D fit = gogarchfit(spec = spec, data = dji30ret[,1:4], gfun = "tanh")
##D filter = gogarchfilter(fit, data = dji30ret[,1:4])
## End(Not run)


