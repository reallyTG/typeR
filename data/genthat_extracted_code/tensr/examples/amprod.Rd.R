library(tensr)


### Name: amprod
### Title: k-mode product.
### Aliases: amprod

### ** Examples

A <- array(1:8, dim = c(2,2,2))
M <- matrix(1:4, nrow = 2, ncol = 2)
Y <- amprod(A, M, 2)
Y
identical(M %*% mat(A,2), mat(Y,2))



