library(ssvd)


### Name: ssvd-package
### Title: Sparse SVD
### Aliases: ssvd-package
### Keywords: sparse SVD iterative thresholding

### ** Examples

ssvd(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.initial <- ssvd.initial(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.iter <- ssvd.iter.thresh(matrix(rnorm(2^15),2^7,2^8), 
u.old=ans.initial$u, v.old= ans.initial$v, method = "method")



