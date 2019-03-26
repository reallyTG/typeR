library(Matrix)


### Name: diagonalMatrix-class
### Title: Class "diagonalMatrix" of Diagonal Matrices
### Aliases: diagonalMatrix-class as.vector,diagonalMatrix-method
###   coerce,matrix,diagonalMatrix-method
###   coerce,diagonalMatrix,denseMatrix-method
###   coerce,diagonalMatrix,generalMatrix-method
###   coerce,diagonalMatrix,matrix-method
###   coerce,diagonalMatrix,nMatrix-method
###   coerce,diagonalMatrix,nsparseMatrix-method
###   coerce,Matrix,diagonalMatrix-method
###   cbind2,sparseMatrix,diagonalMatrix-method
###   cbind2,diagonalMatrix,sparseMatrix-method
###   rbind2,sparseMatrix,diagonalMatrix-method
###   rbind2,diagonalMatrix,sparseMatrix-method
###   determinant,diagonalMatrix,logical-method
###   norm,diagonalMatrix,character-method coerce,ddiMatrix,matrix-method
###   coerce,ddiMatrix,dgeMatrix-method
###   coerce,ddiMatrix,ddenseMatrix-method
###   coerce,ldiMatrix,ldenseMatrix-method
###   coerce,ddiMatrix,symmetricMatrix-method
###   coerce,ldiMatrix,symmetricMatrix-method
###   coerce,ddiMatrix,triangularMatrix-method
###   coerce,ldiMatrix,triangularMatrix-method
###   coerce,ddiMatrix,CsparseMatrix-method
###   coerce,ldiMatrix,CsparseMatrix-method
###   coerce,ddiMatrix,TsparseMatrix-method
###   coerce,ddiMatrix,dsparseMatrix-method
###   coerce,ldiMatrix,TsparseMatrix-method
###   coerce,ldiMatrix,lsparseMatrix-method cbind2,ddiMatrix,matrix-method
###   cbind2,ldiMatrix,matrix-method cbind2,matrix,ddiMatrix-method
###   cbind2,matrix,ldiMatrix-method rbind2,ddiMatrix,matrix-method
###   rbind2,ldiMatrix,matrix-method rbind2,matrix,ddiMatrix-method
###   rbind2,matrix,ldiMatrix-method cbind2,ddiMatrix,atomicVector-method
###   cbind2,ldiMatrix,atomicVector-method
###   cbind2,atomicVector,ddiMatrix-method
###   cbind2,atomicVector,ldiMatrix-method
###   rbind2,ddiMatrix,atomicVector-method
###   rbind2,ldiMatrix,atomicVector-method
###   rbind2,atomicVector,ddiMatrix-method
###   rbind2,atomicVector,ldiMatrix-method diag,diagonalMatrix-method
###   which,ldiMatrix-method Math,diagonalMatrix-method
###   Ops,diagonalMatrix,triangularMatrix-method
###   Ops,ddiMatrix,sparseMatrix-method Ops,sparseMatrix,ddiMatrix-method
###   Ops,ldiMatrix,sparseMatrix-method Ops,sparseMatrix,ldiMatrix-method
###   Ops,ddiMatrix,numeric-method Ops,numeric,ddiMatrix-method
###   Ops,ldiMatrix,numeric-method Ops,numeric,ldiMatrix-method
###   Ops,ddiMatrix,logical-method Ops,logical,ddiMatrix-method
###   Ops,ldiMatrix,logical-method Ops,logical,ldiMatrix-method
###   Ops,ddiMatrix,ANY-method Ops,ANY,ddiMatrix-method
###   Ops,ldiMatrix,ANY-method Ops,ANY,ldiMatrix-method
###   Ops,ddiMatrix,Matrix-method Ops,Matrix,ddiMatrix-method
###   Ops,ldiMatrix,Matrix-method Ops,Matrix,ldiMatrix-method
###   Ops,ddiMatrix,dMatrix-method Ops,dMatrix,ddiMatrix-method
###   Ops,ldiMatrix,dMatrix-method Ops,dMatrix,ldiMatrix-method
###   Ops,ddiMatrix,ddiMatrix-method Ops,ddiMatrix,ldiMatrix-method
###   Ops,ldiMatrix,ddiMatrix-method Ops,ldiMatrix,ldiMatrix-method
###   Arith,triangularMatrix,diagonalMatrix-method
###   Compare,triangularMatrix,diagonalMatrix-method
###   Logic,triangularMatrix,diagonalMatrix-method
###   Arith,numeric,ddiMatrix-method Arith,numeric,ldiMatrix-method
###   Arith,ddiMatrix,numeric-method Arith,ldiMatrix,numeric-method
###   Arith,logical,ddiMatrix-method Arith,logical,ldiMatrix-method
###   Arith,ddiMatrix,logical-method Arith,ldiMatrix,logical-method
###   -,ddiMatrix,missing-method -,ldiMatrix,missing-method
###   all,ddiMatrix-method all,ldiMatrix-method any,ddiMatrix-method
###   any,ldiMatrix-method prod,ddiMatrix-method prod,ldiMatrix-method
###   sum,ddiMatrix-method sum,ldiMatrix-method
###   ^,ddenseMatrix,ddiMatrix-method ^,ddenseMatrix,ldiMatrix-method
###   ^,ddiMatrix,ddenseMatrix-method ^,ddiMatrix,ldenseMatrix-method
###   ^,ddiMatrix,ndenseMatrix-method ^,ldenseMatrix,ddiMatrix-method
###   ^,ldenseMatrix,ldiMatrix-method ^,ldiMatrix,ddenseMatrix-method
###   ^,ldiMatrix,ldenseMatrix-method ^,ldiMatrix,ndenseMatrix-method
###   ^,ndenseMatrix,ddiMatrix-method ^,ndenseMatrix,ldiMatrix-method
###   /,ddiMatrix,ddenseMatrix-method /,ddiMatrix,ldenseMatrix-method
###   /,ddiMatrix,ndenseMatrix-method /,ldiMatrix,ddenseMatrix-method
###   /,ldiMatrix,ldenseMatrix-method /,ldiMatrix,ndenseMatrix-method
###   *,ddenseMatrix,ddiMatrix-method *,ddenseMatrix,ldiMatrix-method
###   *,ddiMatrix,ddenseMatrix-method *,ddiMatrix,ldenseMatrix-method
###   *,ddiMatrix,ndenseMatrix-method *,ldenseMatrix,ddiMatrix-method
###   *,ldenseMatrix,ldiMatrix-method *,ldiMatrix,ddenseMatrix-method
###   *,ldiMatrix,ldenseMatrix-method *,ldiMatrix,ndenseMatrix-method
###   *,ndenseMatrix,ddiMatrix-method *,ndenseMatrix,ldiMatrix-method
###   &,ddenseMatrix,ddiMatrix-method &,ddenseMatrix,ldiMatrix-method
###   &,ddiMatrix,ddenseMatrix-method &,ddiMatrix,ldenseMatrix-method
###   &,ddiMatrix,ndenseMatrix-method &,ldenseMatrix,ddiMatrix-method
###   &,ldenseMatrix,ldiMatrix-method &,ldiMatrix,ddenseMatrix-method
###   &,ldiMatrix,ldenseMatrix-method &,ldiMatrix,ndenseMatrix-method
###   &,ndenseMatrix,ddiMatrix-method &,ndenseMatrix,ldiMatrix-method
###   %/%,ddiMatrix,ddenseMatrix-method %/%,ddiMatrix,ldenseMatrix-method
###   %/%,ddiMatrix,ndenseMatrix-method %/%,ldiMatrix,ddenseMatrix-method
###   %/%,ldiMatrix,ldenseMatrix-method %/%,ldiMatrix,ndenseMatrix-method
###   %%,ddiMatrix,ddenseMatrix-method %%,ddiMatrix,ldenseMatrix-method
###   %%,ddiMatrix,ndenseMatrix-method %%,ldiMatrix,ddenseMatrix-method
###   %%,ldiMatrix,ldenseMatrix-method %%,ldiMatrix,ndenseMatrix-method
###   ^,Matrix,ddiMatrix-method ^,Matrix,ldiMatrix-method
###   ^,ddiMatrix,Matrix-method ^,ldiMatrix,Matrix-method
###   /,ddiMatrix,Matrix-method /,ldiMatrix,Matrix-method
###   *,Matrix,ddiMatrix-method *,Matrix,ldiMatrix-method
###   *,ddiMatrix,Matrix-method *,ldiMatrix,Matrix-method
###   &,Matrix,ddiMatrix-method &,Matrix,ldiMatrix-method
###   &,ddiMatrix,Matrix-method &,ldiMatrix,Matrix-method
###   %/%,ddiMatrix,Matrix-method %/%,ldiMatrix,Matrix-method
###   %%,ddiMatrix,Matrix-method %%,ldiMatrix,Matrix-method
###   Ops,diagonalMatrix,diagonalMatrix-method
###   Ops,diagonalMatrix,ddiMatrix-method
###   Ops,ddiMatrix,diagonalMatrix-method Summary,ddiMatrix-method
###   Summary,ldiMatrix-method chol2inv,diagonalMatrix-method
###   t,diagonalMatrix-method print,diagonalMatrix-method
###   show,diagonalMatrix-method summary,diagonalMatrix-method
### Keywords: classes

### ** Examples

I5 <- Diagonal(5)
D5 <- Diagonal(x = 10*(1:5))
## trivial (but explicitly defined) methods:
stopifnot(identical(crossprod(I5), I5),
          identical(tcrossprod(I5), I5),
          identical(crossprod(I5, D5), D5),
          identical(tcrossprod(D5, I5), D5),
          identical(solve(D5), solve(D5, I5)),
          all.equal(D5, solve(solve(D5)), tolerance = 1e-12)
          )
solve(D5)# efficient as is diagonal

# an unusual way to construct a band matrix:
rbind2(cbind2(I5, D5),
       cbind2(D5, I5))



