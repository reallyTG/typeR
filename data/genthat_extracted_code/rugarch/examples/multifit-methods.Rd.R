library(rugarch)


### Name: multifit-methods
### Title: function: Univariate GARCH and ARFIMA Multiple Fitting
### Aliases: multifit multifit-methods multifit,ANY-method
###   multifit,uGARCHmultispec-method multifit,ARFIMAmultispec-method
### Keywords: methods

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec()
##D mspec = multispec( replicate(spec, n = 4) )
##D fitlist = multifit(multispec = mspec, data = dji30ret[,1:4])
## End(Not run)


