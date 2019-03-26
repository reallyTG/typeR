library(RcppCNPy)


### Name: RcppCNPy-package
### Title: File access to data files written by (or for) NumPy (Numeric
###   Python) modules
### Aliases: RcppCNPy-package RcppCNPy npyLoad npySave npyHasIntegerSupport
### Keywords: package

### ** Examples

## Not run: 
##D     library(RcppCNPy)
##D 
##D     ## load NumPy file with floating-point data
##D     fmat <- npyLoad("fmat.npy")
##D     
##D     ## load NumPy file with integer data
##D     imat <- npyLoad("imat.npy", "integer")
##D 
##D     ## save floating-point data: matrix and vector
##D     M <- matrix(0:11, 3, 4, byrow=TRUE) * 1.1
##D     v <- v <- 0:4 * 1.1
##D     npySave("fmat.npy", M)
##D     npySave("fvec.npy", v)
##D 
##D     ## save integer data: matrix and vector
##D     M <- matrix(0:11, 3, 4, byrow=TRUE)
##D     v <- v <- 0:4 
##D     npySave("imat.npy", M)
##D     npySave("ivec.npy", v)
##D     
##D     
## End(Not run)  



