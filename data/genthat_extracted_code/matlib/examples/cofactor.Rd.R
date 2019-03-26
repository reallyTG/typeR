library(matlib)


### Name: cofactor
### Title: Cofactor of A[i,j]
### Aliases: cofactor

### ** Examples

M <- matrix(c(4, -12, -4,
              2,   1,  3,
             -1,  -3,  2), 3, 3, byrow=TRUE)
cofactor(M, 1, 1)
cofactor(M, 1, 2)
cofactor(M, 1, 3)




