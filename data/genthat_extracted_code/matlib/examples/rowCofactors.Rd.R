library(matlib)


### Name: rowCofactors
### Title: Row Cofactors of A[i,]
### Aliases: rowCofactors

### ** Examples

M <- matrix(c(4, -12, -4,
              2,   1,  3,
             -1,  -3,  2), 3, 3, byrow=TRUE)
minor(M, 1, 1)
minor(M, 1, 2)
minor(M, 1, 3)
rowCofactors(M, 1)
Det(M)
# expansion by cofactors of row 1
M[1,] %*% rowCofactors(M,1)




