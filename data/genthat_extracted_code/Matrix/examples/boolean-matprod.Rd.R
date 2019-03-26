library(Matrix)


### Name: %&%-methods
### Title: Boolean Arithmetic Matrix Products: '%&%' and Methods
### Aliases: %&% %&%-methods %&%,ANY,ANY-method %&%,ANY,matrix-method
###   %&%,ANY,Matrix-method %&%,matrix,ANY-method %&%,Matrix,ANY-method
###   %&%,matrix,matrix-method %&%,Matrix,Matrix-method
###   %&%,mMatrix,mMatrix-method %&%,mMatrix,nMatrix-method
###   %&%,nMatrix,mMatrix-method %&%,nMatrix,nMatrix-method
###   %&%,nMatrix,nsparseMatrix-method %&%,nsparseMatrix,nMatrix-method
###   %&%,nsparseMatrix,nsparseMatrix-method
###   %&%,nCsparseMatrix,nCsparseMatrix-method
###   %&%,nCsparseMatrix,nsparseMatrix-method
###   %&%,nsparseMatrix,nCsparseMatrix-method
###   %&%,diagonalMatrix,geMatrix-method %&%,geMatrix,diagonalMatrix-method
###   %&%,CsparseMatrix,diagonalMatrix-method
###   %&%,diagonalMatrix,CsparseMatrix-method
###   %&%,diagonalMatrix,diagonalMatrix-method
###   %&%,diagonalMatrix,sparseMatrix-method
###   %&%,sparseMatrix,diagonalMatrix-method
###   %&%,mMatrix,sparseVector-method %&%,numLike,sparseVector-method
###   %&%,sparseVector,mMatrix-method %&%,sparseVector,numLike-method
###   %&%,sparseVector,sparseVector-method
### Keywords: methods

### ** Examples

set.seed(7)
L <- Matrix(rnorm(20) > 1,    4,5)
(N <- as(L, "nMatrix"))
D <- Matrix(round(rnorm(30)), 5,6) # -> values in -1:1 (for this seed)
L %&% D
stopifnot(identical(L %&% D, N %&% D),
          all(L %&% D == as((L %*% abs(D)) > 0, "sparseMatrix")))

## cross products , possibly with  boolArith = TRUE :
crossprod(N)     # -> sparse patter'n' (TRUE/FALSE : boolean arithmetic)
crossprod(N  +0) # -> numeric Matrix (with same "pattern")
stopifnot(all(crossprod(N) == t(N) %&% N),
          identical(crossprod(N), crossprod(N +0, boolArith=TRUE)),
          identical(crossprod(L), crossprod(N   , boolArith=FALSE)))
crossprod(D, boolArith =  TRUE) # pattern: "nsCMatrix"
crossprod(L, boolArith =  TRUE) #  ditto
crossprod(L, boolArith = FALSE) # numeric: "dsCMatrix"



