library(metaSEM)


### Name: is.pd
### Title: Test Positive Definiteness of a List of Square Matrices
### Aliases: is.pd
### Keywords: utilities

### ** Examples

A <- diag(1,3)
is.pd(A)
# TRUE

B <- matrix(c(1,2,2,1), ncol=2)
is.pd(B)
# FALSE

is.pd(list(A, B))
# TRUE FALSE

C <- A
C[2,1] <- C[1,2] <- NA
is.pd(C)
# NA



