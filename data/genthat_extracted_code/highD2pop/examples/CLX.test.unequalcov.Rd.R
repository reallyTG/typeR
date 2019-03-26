library(highD2pop)


### Name: CLX.test.unequalcov
### Title: Cai, Liu, and Xia equal means test under unequal covariances
### Aliases: CLX.test.unequalcov
### Keywords: htest multivariate

### ** Examples

## Not run: 
##D 	
##D data(chr1qseg)
##D 	
##D 	impute <- function(x) 	
##D 	{ 	
##D 		x[which(is.na(x))] <- mean(x,na.rm=TRUE)
##D 		return(x)
##D 	}
##D 	
##D 	X <- apply(chr1qseg$X,2,impute)
##D 	Y <- apply(chr1qseg$Y,2,impute)
##D 	
##D 	CLX.test.unequalcov(X,Y)
##D 	
## End(Not run)



