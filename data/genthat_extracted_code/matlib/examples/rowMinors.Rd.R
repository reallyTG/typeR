library(matlib)


### Name: rowMinors
### Title: Row Minors of A[i,]
### Aliases: rowMinors

### ** Examples

M <- matrix(c(4, -12, -4,
              2,   1,  3,
             -1,  -3,  2), 3, 3, byrow=TRUE)
minor(M, 1, 1)
minor(M, 1, 2)
minor(M, 1, 3)
rowMinors(M, 1)



