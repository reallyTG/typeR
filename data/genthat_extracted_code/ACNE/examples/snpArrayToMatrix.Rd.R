library(ACNE)


### Name: snpArrayToMatrix
### Title: Reshapes SNP data in matrix form to array form and vice versa
### Aliases: snpArrayToMatrix snpMatrixToArray
### Keywords: internal

### ** Examples

Y <- matrix(rnorm(200), nrow=20, ncol=10)
str(Y)

V <- snpMatrixToArray(Y)
str(V)

Y2 <- snpArrayToMatrix(V)
str(Y2)

stopifnot(identical(Y2, Y))




