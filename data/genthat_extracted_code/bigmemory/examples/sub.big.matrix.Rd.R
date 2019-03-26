library(bigmemory)


### Name: is.sub.big.matrix
### Title: Submatrix support
### Aliases: is.sub.big.matrix is.sub.big.matrix,big.matrix-method
###   sub.big.matrix sub.big.matrix,big.matrix-method
### Keywords: methods

### ** Examples

x <- big.matrix(10, 5, init=0, type="double")
x[,] <- 1:50
y <- sub.big.matrix(x, 2, 9, 2, 3)
y[,]
y[1,1] <- -99
x[,]
rm(x)



