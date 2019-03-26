library(Matrix)


### Name: nnzero
### Title: The Number of Non-Zero Values of a Matrix
### Aliases: nnzero nnzero,ANY-method nnzero,denseMatrix-method
###   nnzero,diagonalMatrix-method nnzero,indMatrix-method
###   nnzero,sparseMatrix-method nnzero,CHMfactor-method
### Keywords: attribute

### ** Examples

m <- Matrix(0+1:28, nrow = 4)
m[-3,c(2,4:5,7)] <- m[ 3, 1:4] <- m[1:3, 6] <- 0
(mT <- as(m, "dgTMatrix"))
nnzero(mT)
(S <- crossprod(mT))
nnzero(S)
str(S) # slots are smaller than nnzero()
stopifnot(nnzero(S) == sum(as.matrix(S) != 0))# failed earlier

data(KNex)
M <- KNex$mm
class(M)
dim(M)
length(M); stopifnot(length(M) == prod(dim(M)))
nnzero(M) # more relevant than length
## the above are also visible from
str(M)



