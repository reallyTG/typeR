library(spam)


### Name: permutation
### Title: Permute a matrix
### Aliases: permutation permutation.spam permutation,spam-method
###   permutation,matrix-method
### Keywords: array

### ** Examples

A <- spam(1:12,3)
P <- c(3,1,2)
Q <- c(2,3,1,4)

permutation(A,P,Q)-A[order(P),order(Q)]

permutation(A,P,Q,ind=TRUE)-A[P,Q]




