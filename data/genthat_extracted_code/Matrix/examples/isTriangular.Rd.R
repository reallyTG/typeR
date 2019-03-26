library(Matrix)


### Name: isTriangular
### Title: isTriangular() and isDiagonal() Methods
### Aliases: isDiagonal isDiagonal-methods
###   isDiagonal,symmetricMatrix-method isDiagonal,triangularMatrix-method
###   isDiagonal,denseMatrix-method isDiagonal,diagonalMatrix-method
###   isDiagonal,sparseMatrix-method isDiagonal,matrix-method isTriangular
###   isTriangular-methods isTriangular,triangularMatrix-method
###   isTriangular,denseMatrix-method isTriangular,diagonalMatrix-method
###   isTriangular,BunchKaufman-method isTriangular,Cholesky-method
###   isTriangular,CsparseMatrix-method isTriangular,TsparseMatrix-method
###   isTriangular,dtCMatrix-method isTriangular,dtRMatrix-method
###   isTriangular,dtTMatrix-method isTriangular,dtpMatrix-method
###   isTriangular,dtrMatrix-method isTriangular,ltCMatrix-method
###   isTriangular,ltRMatrix-method isTriangular,ltTMatrix-method
###   isTriangular,ltpMatrix-method isTriangular,ltrMatrix-method
###   isTriangular,ntCMatrix-method isTriangular,ntRMatrix-method
###   isTriangular,ntTMatrix-method isTriangular,ntpMatrix-method
###   isTriangular,ntrMatrix-method isTriangular,pBunchKaufman-method
###   isTriangular,pCholesky-method isTriangular,matrix-method
### Keywords: methods

### ** Examples

isTriangular(Diagonal(4))
## is TRUE: a diagonal matrix is also (both upper and lower) triangular
(M <- Matrix(c(1,2,0,1), 2,2))
isTriangular(M) # TRUE (*and* of formal class "dtrMatrix")
isTriangular(as(M, "dgeMatrix")) # still triangular, even if not "formally"
isTriangular(crossprod(M)) # FALSE

isDiagonal(matrix(c(2,0,0,1), 2,2)) # TRUE



