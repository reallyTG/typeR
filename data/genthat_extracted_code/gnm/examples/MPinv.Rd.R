library(gnm)


### Name: MPinv
### Title: Moore-Penrose Pseudoinverse of a Real-valued Matrix
### Aliases: MPinv
### Keywords: array

### ** Examples

A <- matrix(c(1, 1, 0,
              1, 1, 0,
              2, 3, 4), 3, 3)
B <- MPinv(A)
A %*% B %*% A - A  # essentially zero
B %*% A %*% B - B  # essentially zero
attr(B, "rank")    # here 2

## demonstration that "svd" and "chol" deliver essentially the same
## results for symmetric matrices:
A <- crossprod(A)
MPinv(A) - MPinv(A, method = "chol") ##  (essentially zero) 



