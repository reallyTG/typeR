library(ssvd)


### Name: ssvd.iter.thresh
### Title: Iterative thresholding sparse SVD
### Aliases: ssvd.iter.thresh
### Keywords: sparse SVD iterative thresholding

### ** Examples

ans.initial <- ssvd.initial(matrix(rnorm(2^15),2^7,2^8), method = "method")
ans.iter <- ssvd.iter.thresh(matrix(rnorm(2^15),2^7,2^8), 
u.old=ans.initial$u, v.old= ans.initial$v, method = "method")



