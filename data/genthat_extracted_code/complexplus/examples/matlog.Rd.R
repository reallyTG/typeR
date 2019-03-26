library(complexplus)


### Name: matlog
### Title: Matrix Logarithm
### Aliases: matlog

### ** Examples

A <- matrix(c(1, 2, 2+3i, 5), ncol = 2)  # complex matrix
B <- matrix(c(2, 0, 3, 4), ncol = 2)  # real matrix with positive eigenvalues

matlog(A)
matlog(A, "Eigen")  # uses Eigen method in function logm
matlog(B)
matlog(B, "Eigen")  # uses Eigen method in function logm




