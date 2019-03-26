library(compositions)


### Name: matmult
### Title: inner product for matrices and vectors
### Aliases: %*% %*%.default
### Keywords: multivariate

### ** Examples

M <- matrix(c(
0.2,0.1,0.0,
0.1,0.2,0.0,
0.0,0.0,0.2),byrow=TRUE,nrow=3)
x <- c(1,1,2)
M %*% x
x %*% M
x %*% x
M %*% M
t(x) %*% M




