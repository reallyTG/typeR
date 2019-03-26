library(compositions)


### Name: acompscalarproduct
### Title: inner product for datasets with a vector space structure
### Aliases: %*%.acomp %*%.aplus
### Keywords: multivariate

### ** Examples

x <- acomp(matrix( sqrt(1:12), ncol= 3 ))
x%*%x
A <- matrix( 1:9,nrow=3)
x %*% A %*% x
x %*% A
A %*% x
A <- matrix( 1:4,nrow=2)
x %*% A %*% x
x %*% A
A %*% x
x <- aplus(matrix( sqrt(1:12), ncol= 3 ))
x%*%x
A <- matrix( 1:9,nrow=3)
x %*% A %*% x
x %*% A
A %*% x



