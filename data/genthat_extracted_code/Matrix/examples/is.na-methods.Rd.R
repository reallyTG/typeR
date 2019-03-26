library(Matrix)


### Name: is.na-methods
### Title: is.na(), is.infinite() Methods for 'Matrix' Objects
### Aliases: is.finite,ddenseMatrix-method is.finite,dgeMatrix-method
###   is.finite,dsparseMatrix-method is.finite,diagonalMatrix-method
###   is.finite,lMatrix-method is.finite,nMatrix-method
###   is.finite,indMatrix-method is.infinite,ddenseMatrix-method
###   is.infinite,dsparseMatrix-method is.infinite,diagonalMatrix-method
###   is.infinite,lMatrix-method is.infinite,nMatrix-method
###   is.infinite,indMatrix-method is.na,denseMatrix-method
###   is.na,indMatrix-method is.na,sparseMatrix-method
###   anyNA,nsparseMatrix-method anyNA,nsparseVector-method
###   anyNA,sparseVector-method anyNA,xMatrix-method anyNA,dMatrix-method
###   anyNA,iMatrix-method anyNA,lMatrix-method anyNA,zMatrix-method
###   anyNA,ndenseMatrix-method is.na-methods
### Keywords: methods

### ** Examples

M <- Matrix(1:6, nrow=4, ncol=3,
       dimnames = list(c("a", "b", "c", "d"), c("A", "B", "C")))
stopifnot(all(!is.na(M)))
M[2:3,2] <- NA
is.na(M)
if(exists("anyNA", mode="function"))
anyNA(M)

A <- spMatrix(10,20, i = c(1,3:8),
                     j = c(2,9,6:10),
                     x = 7 * (1:7))
stopifnot(all(!is.na(A)))
A[2,3] <- A[1,2] <- A[5, 5:9] <- NA
inA <- is.na(A)
stopifnot(sum(inA) == 1+1+5)
## Don't show: 
if(exists("anyNA", mode="function"))
stopifnot(anyNA(M), anyNA(A))
## End(Don't show)



