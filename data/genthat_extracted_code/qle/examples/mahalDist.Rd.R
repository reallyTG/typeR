library(qle)


### Name: mahalDist
### Title: Mahalanobis distance of statistics
### Aliases: mahalDist

### ** Examples

 data(normal)
 # (weighted) least squares
 mahalDist(c(2,1), qsd, Sigma=diag(2))
 
 # generalized LS with variance average approximation 
	# here: same as quasi-deviance
 mahalDist(c(2,1), qsd)  
 



