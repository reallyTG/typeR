library(highD2pop)


### Name: GCT.test
### Title: Generalized component test
### Aliases: GCT.test
### Keywords: htest multivariate

### ** Examples

## Not run: 
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
##D 	
##D 	GCT.test(X,Y)
##D 	
##D 	
## End(Not run)	



