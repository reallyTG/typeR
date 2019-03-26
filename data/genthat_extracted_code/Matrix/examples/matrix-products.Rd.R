library(Matrix)


### Name: matrix-products
### Title: Matrix (Cross) Products (of Transpose)
### Aliases: %*%-methods crossprod-methods tcrossprod-methods
###   %*%,ddenseMatrix,ldenseMatrix-method %*%,ddenseMatrix,matrix-method
###   %*%,ddenseMatrix,ndenseMatrix-method
###   %*%,ldenseMatrix,ddenseMatrix-method
###   %*%,ldenseMatrix,ldenseMatrix-method %*%,ldenseMatrix,matrix-method
###   %*%,ldenseMatrix,ndenseMatrix-method %*%,matrix,ddenseMatrix-method
###   %*%,matrix,ldenseMatrix-method %*%,matrix,ndenseMatrix-method
###   %*%,ndenseMatrix,ddenseMatrix-method
###   %*%,ndenseMatrix,ldenseMatrix-method %*%,ndenseMatrix,matrix-method
###   %*%,ndenseMatrix,ndenseMatrix-method %*%,dgeMatrix,dgeMatrix-method
###   %*%,dgeMatrix,matrix-method %*%,dgeMatrix,numLike-method
###   %*%,matrix,dgeMatrix-method %*%,numLike,dgeMatrix-method
###   %*%,numLike,CsparseMatrix-method
###   %*%,CsparseMatrix,CsparseMatrix-method
###   %*%,CsparseMatrix,ddenseMatrix-method %*%,CsparseMatrix,matrix-method
###   %*%,CsparseMatrix,numLike-method
###   %*%,ddenseMatrix,CsparseMatrix-method %*%,matrix,CsparseMatrix-method
###   %*%,matrix,sparseMatrix-method %*%,sparseMatrix,matrix-method
###   %*%,ddenseMatrix,ddenseMatrix-method
###   %*%,dgeMatrix,diagonalMatrix-method %*%,matrix,diagonalMatrix-method
###   %*%,diagonalMatrix,dgeMatrix-method
###   %*%,diagonalMatrix,diagonalMatrix-method
###   %*%,diagonalMatrix,matrix-method
###   %*%,diagonalMatrix,CsparseMatrix-method
###   %*%,diagonalMatrix,sparseMatrix-method
###   %*%,CsparseMatrix,diagonalMatrix-method
###   %*%,sparseMatrix,diagonalMatrix-method
###   %*%,denseMatrix,diagonalMatrix-method
###   %*%,diagonalMatrix,denseMatrix-method
###   %*%,diagonalMatrix,lgeMatrix-method
###   %*%,lgeMatrix,diagonalMatrix-method %*%,nMatrix,lMatrix-method
###   %*%,lMatrix,nMatrix-method %*%,lMatrix,lMatrix-method
###   %*%,nMatrix,nMatrix-method %*%,dMatrix,lMatrix-method
###   %*%,dMatrix,nMatrix-method %*%,lMatrix,dMatrix-method
###   %*%,nMatrix,dMatrix-method %*%,dMatrix,integer-method
###   %*%,integer,dMatrix-method %*%,Matrix,numLike-method
###   %*%,numLike,Matrix-method %*%,Matrix,ANY-method %*%,ANY,Matrix-method
###   %*%,Matrix,matrix-method %*%,matrix,Matrix-method
###   %*%,ddenseMatrix,dsparseMatrix-method
###   %*%,dgeMatrix,dsparseMatrix-method
###   %*%,dsparseMatrix,ddenseMatrix-method
###   %*%,dsparseMatrix,dgeMatrix-method %*%,ddenseMatrix,dsyMatrix-method
###   %*%,matrix,dsyMatrix-method %*%,dsyMatrix,dsyMatrix-method
###   %*%,dspMatrix,ddenseMatrix-method %*%,dspMatrix,matrix-method
###   %*%,dsyMatrix,ddenseMatrix-method %*%,dsyMatrix,matrix-method
###   %*%,dtpMatrix,ddenseMatrix-method %*%,dgeMatrix,dtpMatrix-method
###   %*%,dtpMatrix,matrix-method %*%,matrix,dtpMatrix-method
###   %*%,dtrMatrix,dtrMatrix-method %*%,ddenseMatrix,dtrMatrix-method
###   %*%,dtrMatrix,ddenseMatrix-method %*%,dtrMatrix,matrix-method
###   %*%,matrix,dtrMatrix-method %*%,matrix,indMatrix-method
###   %*%,indMatrix,matrix-method %*%,indMatrix,indMatrix-method
###   %*%,Matrix,indMatrix-method %*%,indMatrix,Matrix-method
###   %*%,lgCMatrix,lgCMatrix-method %*%,lsparseMatrix,lsparseMatrix-method
###   %*%,lsparseMatrix,ldenseMatrix-method
###   %*%,ldenseMatrix,lsparseMatrix-method %*%,ngCMatrix,ngCMatrix-method
###   %*%,nsparseMatrix,nsparseMatrix-method
###   %*%,nsparseMatrix,ndenseMatrix-method
###   %*%,ndenseMatrix,nsparseMatrix-method %*%,matrix,pMatrix-method
###   %*%,pMatrix,matrix-method %*%,pMatrix,pMatrix-method
###   %*%,Matrix,pMatrix-method %*%,pMatrix,Matrix-method
###   %*%,mMatrix,sparseVector-method %*%,sparseVector,mMatrix-method
###   %*%,sparseVector,sparseVector-method %*%,numLike,sparseVector-method
###   %*%,sparseVector,numLike-method %*%,TsparseMatrix,ANY-method
###   %*%,ANY,TsparseMatrix-method %*%,TsparseMatrix,Matrix-method
###   %*%,Matrix,TsparseMatrix-method
###   %*%,TsparseMatrix,TsparseMatrix-method crossprod-methods
###   crossprod,dgeMatrix,dgeMatrix-method
###   crossprod,dgeMatrix,matrix-method crossprod,dgeMatrix,numLike-method
###   crossprod,dgeMatrix,missing-method crossprod,matrix,dgeMatrix-method
###   crossprod,numLike,dgeMatrix-method
###   crossprod,numLike,CsparseMatrix-method
###   crossprod,CsparseMatrix,missing-method
###   crossprod,CsparseMatrix,CsparseMatrix-method
###   crossprod,CsparseMatrix,ddenseMatrix-method
###   crossprod,CsparseMatrix,matrix-method
###   crossprod,CsparseMatrix,numLike-method
###   crossprod,ddenseMatrix,CsparseMatrix-method
###   crossprod,matrix,CsparseMatrix-method
###   crossprod,ddenseMatrix,missing-method
###   crossprod,ddenseMatrix,dgCMatrix-method
###   crossprod,dgCMatrix,dgeMatrix-method
###   crossprod,CsparseMatrix,diagonalMatrix-method
###   crossprod,diagonalMatrix,CsparseMatrix-method
###   crossprod,diagonalMatrix,dgeMatrix-method
###   crossprod,diagonalMatrix,diagonalMatrix-method
###   crossprod,diagonalMatrix,lgeMatrix-method
###   crossprod,diagonalMatrix,matrix-method
###   crossprod,diagonalMatrix,missing-method
###   crossprod,diagonalMatrix,sparseMatrix-method
###   crossprod,sparseMatrix,diagonalMatrix-method
###   crossprod,ANY,Matrix-method crossprod,Matrix,numLike-method
###   crossprod,numLike,Matrix-method crossprod,Matrix,ANY-method
###   crossprod,Matrix,missing-method crossprod,Matrix,Matrix-method
###   crossprod,Matrix,matrix-method crossprod,matrix,Matrix-method
###   crossprod,matrix,diagonalMatrix-method
###   crossprod,ddenseMatrix,dsparseMatrix-method
###   crossprod,dgeMatrix,dsparseMatrix-method
###   crossprod,dsparseMatrix,ddenseMatrix-method
###   crossprod,dsparseMatrix,dgeMatrix-method
###   crossprod,dtpMatrix,ddenseMatrix-method
###   crossprod,dtpMatrix,matrix-method
###   crossprod,dtrMatrix,ddenseMatrix-method
###   crossprod,dtrMatrix,dtrMatrix-method
###   crossprod,dtrMatrix,matrix-method crossprod,matrix,dtrMatrix-method
###   crossprod,dtrMatrix,missing-method crossprod,indMatrix,matrix-method
###   crossprod,indMatrix,Matrix-method
###   crossprod,indMatrix,indMatrix-method
###   crossprod,indMatrix,missing-method crossprod,lgCMatrix,missing-method
###   crossprod,lgTMatrix,missing-method crossprod,lsparseMatrix-method
###   crossprod,lsparseMatrix,missing-method
###   crossprod,lsparseMatrix,lsparseMatrix-method
###   crossprod,lsparseMatrix,ldenseMatrix-method
###   crossprod,ldenseMatrix,lsparseMatrix-method
###   crossprod,ngCMatrix,missing-method crossprod,ngTMatrix,missing-method
###   crossprod,nsparseMatrix-method crossprod,nsparseMatrix,missing-method
###   crossprod,nsparseMatrix,nsparseMatrix-method
###   crossprod,nsparseMatrix,ndenseMatrix-method
###   crossprod,ndenseMatrix,nsparseMatrix-method
###   crossprod,pMatrix,matrix-method crossprod,pMatrix,Matrix-method
###   crossprod,pMatrix,pMatrix-method crossprod,pMatrix,missing-method
###   crossprod,mMatrix,sparseVector-method
###   crossprod,sparseVector,mMatrix-method
###   crossprod,sparseVector,missing-method
###   crossprod,sparseVector,sparseVector-method
###   crossprod,numLike,sparseVector-method
###   crossprod,sparseVector,numLike-method
###   crossprod,TsparseMatrix,ANY-method crossprod,ANY,TsparseMatrix-method
###   crossprod,TsparseMatrix,Matrix-method
###   crossprod,Matrix,TsparseMatrix-method
###   crossprod,TsparseMatrix,TsparseMatrix-method
###   crossprod,TsparseMatrix,missing-method
###   crossprod,symmetricMatrix,Matrix-method
###   crossprod,symmetricMatrix,missing-method
###   crossprod,symmetricMatrix,ANY-method
###   crossprod,ddenseMatrix,ddenseMatrix-method
###   crossprod,ddenseMatrix,ldenseMatrix-method
###   crossprod,ddenseMatrix,matrix-method
###   crossprod,ddenseMatrix,ndenseMatrix-method
###   crossprod,ldenseMatrix,ddenseMatrix-method
###   crossprod,ldenseMatrix,ldenseMatrix-method
###   crossprod,ldenseMatrix,matrix-method
###   crossprod,ldenseMatrix,missing-method
###   crossprod,ldenseMatrix,ndenseMatrix-method
###   crossprod,ndenseMatrix,ddenseMatrix-method
###   crossprod,ndenseMatrix,ldenseMatrix-method
###   crossprod,ndenseMatrix,matrix-method
###   crossprod,ndenseMatrix,missing-method
###   crossprod,ndenseMatrix,ndenseMatrix-method tcrossprod-methods
###   tcrossprod,dgeMatrix,missing-method
###   tcrossprod,dgeMatrix,dgeMatrix-method
###   tcrossprod,dgeMatrix,matrix-method
###   tcrossprod,dgeMatrix,numLike-method
###   tcrossprod,matrix,dgeMatrix-method
###   tcrossprod,numLike,dgeMatrix-method
###   tcrossprod,CsparseMatrix,ddenseMatrix-method
###   tcrossprod,CsparseMatrix,matrix-method
###   tcrossprod,CsparseMatrix,numLike-method
###   tcrossprod,ddenseMatrix,CsparseMatrix-method
###   tcrossprod,matrix,CsparseMatrix-method
###   tcrossprod,numLike,CsparseMatrix-method
###   tcrossprod,CsparseMatrix,CsparseMatrix-method
###   tcrossprod,CsparseMatrix,missing-method
###   tcrossprod,ddenseMatrix,missing-method
###   tcrossprod,CsparseMatrix,diagonalMatrix-method
###   tcrossprod,dgeMatrix,diagonalMatrix-method
###   tcrossprod,diagonalMatrix,CsparseMatrix-method
###   tcrossprod,diagonalMatrix,diagonalMatrix-method
###   tcrossprod,diagonalMatrix,matrix-method
###   tcrossprod,diagonalMatrix,missing-method
###   tcrossprod,diagonalMatrix,sparseMatrix-method
###   tcrossprod,lgeMatrix,diagonalMatrix-method
###   tcrossprod,matrix,diagonalMatrix-method
###   tcrossprod,sparseMatrix,diagonalMatrix-method
###   tcrossprod,ANY,Matrix-method tcrossprod,numLike,Matrix-method
###   tcrossprod,Matrix,numLike-method tcrossprod,Matrix,ANY-method
###   tcrossprod,Matrix,missing-method tcrossprod,Matrix,Matrix-method
###   tcrossprod,Matrix,matrix-method tcrossprod,matrix,Matrix-method
###   tcrossprod,ddenseMatrix,dtrMatrix-method
###   tcrossprod,dtrMatrix,dtrMatrix-method
###   tcrossprod,matrix,dtrMatrix-method tcrossprod,matrix,indMatrix-method
###   tcrossprod,Matrix,indMatrix-method
###   tcrossprod,indMatrix,indMatrix-method
###   tcrossprod,indMatrix,missing-method
###   tcrossprod,lgCMatrix,missing-method
###   tcrossprod,lgTMatrix,missing-method
###   tcrossprod,lsparseMatrix,missing-method
###   tcrossprod,ngCMatrix,missing-method
###   tcrossprod,ngTMatrix,missing-method
###   tcrossprod,nsparseMatrix,missing-method
###   tcrossprod,matrix,pMatrix-method tcrossprod,Matrix,pMatrix-method
###   tcrossprod,pMatrix,pMatrix-method tcrossprod,pMatrix,missing-method
###   tcrossprod,mMatrix,sparseVector-method
###   tcrossprod,sparseMatrix,sparseVector-method
###   tcrossprod,sparseVector,mMatrix-method
###   tcrossprod,sparseVector,missing-method
###   tcrossprod,sparseVector,sparseMatrix-method
###   tcrossprod,sparseVector,sparseVector-method
###   tcrossprod,numLike,sparseVector-method
###   tcrossprod,sparseVector,numLike-method
###   tcrossprod,TsparseMatrix,ANY-method
###   tcrossprod,ANY,TsparseMatrix-method
###   tcrossprod,TsparseMatrix,Matrix-method
###   tcrossprod,Matrix,TsparseMatrix-method
###   tcrossprod,TsparseMatrix,TsparseMatrix-method
###   tcrossprod,TsparseMatrix,missing-method
###   tcrossprod,Matrix,symmetricMatrix-method
###   tcrossprod,ANY,symmetricMatrix-method
###   tcrossprod,ddenseMatrix,ddenseMatrix-method
###   tcrossprod,ddenseMatrix,ldenseMatrix-method
###   tcrossprod,ddenseMatrix,matrix-method
###   tcrossprod,ddenseMatrix,ndenseMatrix-method
###   tcrossprod,ldenseMatrix,ddenseMatrix-method
###   tcrossprod,ldenseMatrix,ldenseMatrix-method
###   tcrossprod,ldenseMatrix,matrix-method
###   tcrossprod,ldenseMatrix,missing-method
###   tcrossprod,ldenseMatrix,ndenseMatrix-method
###   tcrossprod,ndenseMatrix,ddenseMatrix-method
###   tcrossprod,ndenseMatrix,ldenseMatrix-method
###   tcrossprod,ndenseMatrix,matrix-method
###   tcrossprod,ndenseMatrix,missing-method
###   tcrossprod,ndenseMatrix,ndenseMatrix-method
###   tcrossprod,ddenseMatrix,dsCMatrix-method
###   tcrossprod,ddenseMatrix,lsCMatrix-method
###   tcrossprod,ddenseMatrix,nsCMatrix-method
###   tcrossprod,matrix,dsCMatrix-method tcrossprod,matrix,lsCMatrix-method
###   tcrossprod,matrix,nsCMatrix-method %*% crossprod tcrossprod
### Keywords: methods algebra

### ** Examples

 ## A random sparse "incidence" matrix :
 m <- matrix(0, 400, 500)
 set.seed(12)
 m[runif(314, 0, length(m))] <- 1
 mm <- as(m, "dgCMatrix")
 object.size(m) / object.size(mm) # smaller by a factor of > 200

 ## tcrossprod() is very fast:
 system.time(tCmm <- tcrossprod(mm))# 0   (PIII, 933 MHz)
 system.time(cm <- crossprod(t(m))) # 0.16
 system.time(cm. <- tcrossprod(m))  # 0.02

 stopifnot(cm == as(tCmm, "matrix"))

 ## show sparse sub matrix
 tCmm[1:16, 1:30]



