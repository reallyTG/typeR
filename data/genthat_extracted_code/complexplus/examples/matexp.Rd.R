library(complexplus)


### Name: matexp
### Title: Matrix Exponential
### Aliases: matexp

### ** Examples

A <- matrix(c(1, 2, 2+3i, 5), ncol = 2)  # complex matrix
B <- matrix(1:4, ncol = 2)  # real matrix

matexp(A)
matexp(A, "Ward77")  # uses Ward77's method in function expm
matexp(B)
matexp(B, "Taylor")  # uses Taylor's method in function expm




