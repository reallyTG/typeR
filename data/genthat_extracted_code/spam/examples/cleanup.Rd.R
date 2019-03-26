library(spam)


### Name: cleanup
### Title: Cleaning up sparse matrices
### Aliases: cleanup
### Keywords: algebra

### ** Examples

A <- diag.spam(2)
A[1,2] <- 0

all.equal(A, t(A))
isSymmetric.spam(A)
all.equal(cleanup(A), diag.spam(2))



