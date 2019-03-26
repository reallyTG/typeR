library(psd)


### Name: spec-methods
### Title: Generic methods for objects with class "spec"
### Aliases: as.data.frame.spec as.list.spec as.spec as.spec.amt
###   data.frame.spec lines.spec spec-methods

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Objects with class 'spec'
##D ##
##D 
##D set.seed(1234)
##D xn <- rnorm(10)
##D x <- spectrum(xn, plot=FALSE)
##D xc <- psdcore(xn)
##D 
##D xdf <- as.data.frame(x)
##D str(xdf)
##D is.tapers(xdf$taper)
##D 
##D xdfc <- as.data.frame(xc)
##D str(xdfc)
##D is.tapers(xdfc$taper)
##D 
## End(Not run)#REX



