library(RegSDC)


### Name: EnsureMatrix
### Title: Ensure that input is matrix (by as.matrix) and check number of
###   rows (and columns)
### Aliases: EnsureMatrix
### Keywords: internal

### ** Examples

x <- matrix(c(5, 8, 4, 2, 7, 6), 3, 2)
EnsureMatrix(x)
EnsureMatrix(x, 3)
EnsureMatrix(1:4)
EnsureMatrix(1:4, 4)
EnsureMatrix(NULL, 4)
try(EnsureMatrix(x, 4))
try(EnsureMatrix(1:3, 4))
EnsureMatrix(x, 3, 2)
try(EnsureMatrix(x, 3, 3))
try(EnsureMatrix(NULL, 3, 3))



