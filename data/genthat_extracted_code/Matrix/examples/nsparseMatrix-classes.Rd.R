library(Matrix)


### Name: nsparseMatrix-classes
### Title: Sparse "pattern" Matrices
### Aliases: nsparseMatrix-class ngCMatrix-class ntCMatrix-class
###   nsCMatrix-class ngRMatrix-class ntRMatrix-class nsRMatrix-class
###   ngTMatrix-class ntTMatrix-class nsTMatrix-class
###   all,nsparseMatrix-method any,nsparseMatrix-method
###   -,nsparseMatrix,missing-method !,nsparseMatrix-method
###   coerce,nsparseMatrix,dsparseMatrix-method
###   coerce,matrix,ngCMatrix-method coerce,matrix,ngTMatrix-method
###   coerce,matrix,ntCMatrix-method coerce,matrix,ntTMatrix-method
###   coerce,ngCMatrix,dMatrix-method coerce,ngCMatrix,dgCMatrix-method
###   coerce,ngCMatrix,dsparseMatrix-method coerce,ngCMatrix,lMatrix-method
###   coerce,ngCMatrix,lgCMatrix-method
###   coerce,ngCMatrix,lsparseMatrix-method coerce,ngCMatrix,matrix-method
###   coerce,ngCMatrix,ngTMatrix-method coerce,ngCMatrix,ngeMatrix-method
###   coerce,ngCMatrix,ntCMatrix-method coerce,ngTMatrix,dMatrix-method
###   coerce,ngTMatrix,dgTMatrix-method
###   coerce,ngTMatrix,dsparseMatrix-method
###   coerce,ngTMatrix,generalMatrix-method coerce,ngTMatrix,lMatrix-method
###   coerce,ngTMatrix,lgTMatrix-method coerce,ngTMatrix,matrix-method
###   coerce,ngTMatrix,ngCMatrix-method coerce,ngTMatrix,lgeMatrix-method
###   coerce,ngTMatrix,ngeMatrix-method coerce,ngTMatrix,ntTMatrix-method
###   coerce,ngTMatrix,symmetricMatrix-method
###   coerce,ngTMatrix,triangularMatrix-method
###   coerce,nsCMatrix,dMatrix-method coerce,nsCMatrix,dsCMatrix-method
###   coerce,nsCMatrix,dsparseMatrix-method
###   coerce,nsCMatrix,generalMatrix-method coerce,nsCMatrix,lMatrix-method
###   coerce,nsCMatrix,lsCMatrix-method
###   coerce,nsCMatrix,lsparseMatrix-method coerce,nsCMatrix,matrix-method
###   coerce,nsCMatrix,ngCMatrix-method coerce,nsCMatrix,nsTMatrix-method
###   coerce,nsTMatrix,dsTMatrix-method coerce,nsTMatrix,matrix-method
###   coerce,nsTMatrix,ngCMatrix-method coerce,nsTMatrix,ngTMatrix-method
###   coerce,nsTMatrix,nsCMatrix-method coerce,nsTMatrix,nsyMatrix-method
###   coerce,ntCMatrix,dMatrix-method coerce,ntCMatrix,dsparseMatrix-method
###   coerce,ntCMatrix,dtCMatrix-method coerce,ntCMatrix,lMatrix-method
###   coerce,ntCMatrix,lsparseMatrix-method
###   coerce,ntCMatrix,ltCMatrix-method coerce,ntCMatrix,matrix-method
###   coerce,ntCMatrix,ngCMatrix-method
###   coerce,ntCMatrix,TsparseMatrix-method
###   coerce,ntTMatrix,dtTMatrix-method
###   coerce,ntTMatrix,generalMatrix-method coerce,ntTMatrix,matrix-method
###   coerce,ntTMatrix,ngCMatrix-method coerce,ntTMatrix,ngTMatrix-method
###   coerce,ntTMatrix,ntCMatrix-method coerce,ntTMatrix,ntrMatrix-method
###   t,ngCMatrix-method t,ngTMatrix-method t,nsCMatrix-method
###   t,ntCMatrix-method t,nsTMatrix-method t,ntTMatrix-method
###   is.na,nsparseMatrix-method which,ngTMatrix-method
###   which,nsparseMatrix-method which,nsTMatrix-method
###   which,ntTMatrix-method Ops,dsparseMatrix,nsparseMatrix-method
###   Ops,nsparseMatrix,dsparseMatrix-method
###   Ops,lsparseMatrix,nsparseMatrix-method
###   Ops,nsparseMatrix,lsparseMatrix-method
###   Ops,sparseMatrix,nsparseMatrix-method
###   Ops,nsparseMatrix,sparseMatrix-method
###   Arith,nsparseMatrix,Matrix-method Arith,Matrix,nsparseMatrix-method
### Keywords: classes algebra

### ** Examples

(m <- Matrix(c(0,0,2:0), 3,5, dimnames=list(LETTERS[1:3],NULL)))
## ``extract the nonzero-pattern of (m) into an nMatrix'':
nm <- as(m, "nsparseMatrix") ## -> will be a "ngCMatrix"
str(nm) # no 'x' slot
nnm <- !nm     # no longer sparse
(nnm <- as(nnm, "sparseMatrix"))# "lgCMatrix"
## consistency check:
stopifnot(xor(as( nm, "matrix"),
              as(nnm, "matrix")))

## low-level way of adding "non-structural zeros" :
nnm@x[2:4] <- c(FALSE,NA,NA)
nnm
as(nnm, "nMatrix") # NAs *and* non-structural 0  |--->  'TRUE'

data(KNex)
nmm <- as(KNex $ mm, "ngCMatrix")
str(xlx <- crossprod(nmm))# "nsCMatrix"
stopifnot(isSymmetric(xlx))
image(xlx, main=paste("crossprod(nmm) : Sparse", class(xlx)))



