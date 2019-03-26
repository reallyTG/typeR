library(pracma)


### Name: pinv
### Title: Pseudoinverse or Generalized Inverse
### Aliases: pinv
### Keywords: array

### ** Examples

A <- matrix(c(7,6,4,8,10,11,12,9,3,5,1,2), 3, 4)
b <- apply(A, 1, sum)  # 32 16 20  row sum
x <- pinv(A) %*% b
A %*% x              #=> 32 16 20  as column vector



