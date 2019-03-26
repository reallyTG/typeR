library(extracat)


### Name: dcorMVdata
### Title: Multivariate Distance Correlation for two sets of variables
### Aliases: dcorMVdata

### ** Examples

## Not run: 
##D 	so <- scale(olives[,3:8])
##D 	dcorMVdata(so,ind=1)
##D 	
##D 	p1 <- princomp(so)
##D 	so1 <- cbind(so,p1$scores[,1])
##D 	so2 <- cbind(so,p1$scores[,2])
##D 	so12 <- cbind(so,p1$scores[,1:2])
##D 	
##D 	dcorMVdata(so1,ind=7)
##D 	dcorMVdata(so2,ind=7)
##D 	dcorMVdata(so12,ind=7:8)
##D 	# how about principal curves?
## End(Not run)



