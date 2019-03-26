library(Matrix)


### Name: [-methods
### Title: Methods for "[": Extraction or Subsetting in Package 'Matrix'
### Aliases: [-methods [,Matrix,missing,missing,ANY-method
###   [,Matrix,missing,index,missing-method
###   [,Matrix,index,missing,missing-method
###   [,Matrix,index,index,missing-method
###   [,Matrix,lMatrix,missing,ANY-method
###   [,Matrix,logical,missing,ANY-method
###   [,Matrix,matrix,missing,ANY-method
###   [,Matrix,lMatrix,missing,missing-method
###   [,Matrix,logical,missing,missing-method
###   [,Matrix,matrix,missing,missing-method [,Matrix,ANY,ANY,ANY-method
###   [,denseMatrix,matrix,missing,ANY-method
###   [,denseMatrix,matrix,missing,missing-method
###   [,denseMatrix,index,missing,logical-method
###   [,denseMatrix,index,index,logical-method
###   [,denseMatrix,missing,index,logical-method
###   [,diagonalMatrix,index,missing,logical-method
###   [,diagonalMatrix,index,index,logical-method
###   [,diagonalMatrix,missing,index,logical-method
###   [,CsparseMatrix,missing,index,logical-method
###   [,CsparseMatrix,index,missing,logical-method
###   [,CsparseMatrix,index,index,logical-method
###   [,TsparseMatrix,index,missing,logical-method
###   [,TsparseMatrix,missing,index,logical-method
###   [,TsparseMatrix,index,index,logical-method
###   [,sparseMatrix,missing,index,logical-method
###   [,sparseMatrix,index,missing,logical-method
###   [,sparseMatrix,index,index,logical-method
###   [,indMatrix,index,missing,logical-method
### Keywords: methods array

### ** Examples

str(m <- Matrix(round(rnorm(7*4),2), nrow = 7))
stopifnot(identical(m, m[]))
m[2, 3]   # simple number
m[2, 3:4] # simple numeric of length 2
m[2, 3:4, drop=FALSE] # sub matrix of class 'dgeMatrix'
## rows or columns only:
m[1,]     # first row, as simple numeric vector
m[,1:2]   # sub matrix of first two columns

showMethods("[", inherited = FALSE)



