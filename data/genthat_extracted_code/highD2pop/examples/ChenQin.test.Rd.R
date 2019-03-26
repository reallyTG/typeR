library(highD2pop)


### Name: ChenQin.test
### Title: Chen's and Qin's test for equality of two mean vectors
### Aliases: ChenQin.test
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
##D 	ChenQin.test(X,Y)
##D 	
##D 	
## End(Not run)



