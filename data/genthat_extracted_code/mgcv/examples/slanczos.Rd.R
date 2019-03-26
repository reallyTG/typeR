library(mgcv)


### Name: slanczos
### Title: Compute truncated eigen decomposition of a symmetric matrix
### Aliases: slanczos
### Keywords: models smooth regression

### ** Examples

 require(mgcv)
 ## create some x's and knots...
 set.seed(1);
 n <- 700;A <- matrix(runif(n*n),n,n);A <- A+t(A)
 
 ## compare timings of slanczos and eigen
 system.time(er <- slanczos(A,10))
 system.time(um <- eigen(A,symmetric=TRUE))
 
 ## confirm values are the same...
 ind <- c(1:6,(n-3):n)
 range(er$values-um$values[ind]);range(abs(er$vectors)-abs(um$vectors[,ind]))



