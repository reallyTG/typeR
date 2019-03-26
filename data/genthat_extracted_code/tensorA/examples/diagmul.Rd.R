library(tensorA)


### Name: diagmul.tensor
### Title: Multiplication of a tensor with a tensor given by its diagonal
### Aliases: diagmul.tensor
### Keywords: arith

### ** Examples

(A <- matrix(rep(1:3,each=3),nrow=3))
(b <- to.tensor(c(1,1/2,1/3)))
diagmul.tensor(as.tensor(A),2,as.tensor(c(1,1/2,1/3)),1)
diagmul.tensor(as.tensor(A),1,as.tensor(c(1,1/2,1/3)),1)
A %*% diag(b)
diag(b) %*% A



