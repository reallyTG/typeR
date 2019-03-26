library(TRSbook)


### Name: mpinv
### Title: Moore Penrose inverse
### Aliases: mpinv

### ** Examples

A <- matrix(c(2,3,5,4),nrow=2,ncol=2)
solve(A)
mpinv(A)
B <- matrix(c(4,2,8,4),nrow=2,ncol=2)
# solve(B) # gives an error.
mpinv(B)



