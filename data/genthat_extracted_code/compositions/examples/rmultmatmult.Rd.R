library(compositions)


### Name: rmultmatmult
### Title: inner product for datasets with vector scale
### Aliases: %*%.rmult
### Keywords: multivariate

### ** Examples

x <- rmult(matrix( sqrt(1:12), ncol= 3 ))
x%*%x
A <- matrix( 1:9,nrow=3)
x %*% A %*% x
x %*% A
A %*% x
x %*% 1:3
x %*% 1:3
1:3 %*% x 




