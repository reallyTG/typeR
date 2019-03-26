library(adegenet)


### Name: genlight auxiliary functions
### Title: Auxiliary functions for genlight objects
### Aliases: glSum glNA glMean glVar glDotProd
### Keywords: multivariate

### ** Examples

## Not run: 
##D x <- new("genlight", list(c(0,0,1,1,0), c(1,1,1,0,0,1), c(2,1,1,1,1,NA)))
##D x
##D as.matrix(x)
##D ploidy(x)
##D 
##D ## compute statistics - allele as unit ##
##D glNA(x)
##D glSum(x)
##D glMean(x)
##D 
##D ## compute statistics - individual as unit ##
##D glNA(x, FALSE)
##D glSum(x, FALSE)
##D glMean(x, FALSE)
##D 
##D ## explanation: data are taken as relative frequencies
##D temp <- as.matrix(x)/ploidy(x)
##D apply(temp,2, function(e) sum(is.na(e))) # NAs
##D apply(temp,2,sum, na.rm=TRUE) # sum
##D apply(temp,2,mean, na.rm=TRUE) # mean
## End(Not run)



