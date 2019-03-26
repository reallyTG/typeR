library(metaSEM)


### Name: asyCov
### Title: Compute Asymptotic Covariance Matrix of a Correlation/Covariance
###   Matrix
### Aliases: asyCov
### Keywords: meta-analysis

### ** Examples

## Not run: 
##D C1 <- matrix(c(1,0.5,0.4,0.5,1,0.2,0.4,0.2,1), ncol=3)  
##D asyCov(C1, n=100)
##D 
##D ## Data with missing values
##D C2 <- matrix(c(1,0.4,NA,0.4,1,NA,NA,NA,NA), ncol=3)  
##D C3 <- matrix(c(1,0.2,0.2,1), ncol=2)
##D 
##D ## Output is a list of asymptotic covariance matrices
##D asyCov(list(C1,C2,C3), n=c(100,50,50), dropNA=TRUE, as.matrix=FALSE)
##D 
##D ## Output is a stacked matrix of asymptotic covariance matrices
##D asyCov(list(C1,C2), n=c(100,50), as.matrix=TRUE)
##D 
##D ## Output is a stacked matrix of asymptotic covariance matrices
##D asyCov(list(C3,C3), n=c(100,50), as.matrix=TRUE)
## End(Not run)



