library(Matrix)


### Name: solve-methods
### Title: Methods in Package Matrix for Function 'solve()'
### Aliases: solve solve-methods solve,ANY,Matrix-method
###   solve,CHMfactor,ANY-method solve,CHMfactor,ddenseMatrix-method
###   solve,CHMfactor,diagonalMatrix-method
###   solve,CHMfactor,dsparseMatrix-method solve,CHMfactor,matrix-method
###   solve,CHMfactor,missing-method solve,CHMfactor,numeric-method
###   solve,ddenseMatrix,ANY-method solve,ddenseMatrix,matrix-method
###   solve,ddenseMatrix,Matrix-method solve,ddenseMatrix,missing-method
###   solve,ddenseMatrix,numeric-method solve,denseLU,missing-method
###   solve,dgCMatrix,ddenseMatrix-method
###   solve,dgCMatrix,dsparseMatrix-method solve,dgCMatrix,matrix-method
###   solve,dgCMatrix,missing-method solve,dgeMatrix,ddenseMatrix-method
###   solve,dgeMatrix,matrix-method solve,dgeMatrix,missing-method
###   solve,dgeMatrix,sparseMatrix-method
###   solve,diagonalMatrix,matrix-method solve,diagonalMatrix,Matrix-method
###   solve,diagonalMatrix,missing-method solve,dpoMatrix,dgeMatrix-method
###   solve,dpoMatrix,matrix-method solve,dpoMatrix,missing-method
###   solve,dppMatrix,dgeMatrix-method solve,dppMatrix,integer-method
###   solve,dppMatrix,matrix-method solve,dppMatrix,missing-method
###   solve,dsCMatrix,ddenseMatrix-method
###   solve,dsCMatrix,denseMatrix-method
###   solve,dsCMatrix,dsparseMatrix-method solve,dsCMatrix,matrix-method
###   solve,dsCMatrix,missing-method solve,dsCMatrix,numeric-method
###   solve,dspMatrix,ddenseMatrix-method solve,dspMatrix,matrix-method
###   solve,dspMatrix,missing-method solve,dsyMatrix,ddenseMatrix-method
###   solve,dsyMatrix,denseMatrix-method solve,dsyMatrix,matrix-method
###   solve,dsyMatrix,missing-method solve,dtCMatrix,CsparseMatrix-method
###   solve,dtCMatrix,dgeMatrix-method solve,dtCMatrix,matrix-method
###   solve,dtCMatrix,missing-method solve,dtCMatrix,numeric-method
###   solve,dtpMatrix,ddenseMatrix-method solve,dtpMatrix,matrix-method
###   solve,dtpMatrix,missing-method solve,dtrMatrix,ddenseMatrix-method
###   solve,dtrMatrix,dMatrix-method solve,dtrMatrix,matrix-method
###   solve,dtrMatrix,Matrix-method solve,dtrMatrix,missing-method
###   solve,Matrix,ANY-method solve,Matrix,diagonalMatrix-method
###   solve,matrix,Matrix-method solve,Matrix,matrix-method
###   solve,Matrix,missing-method solve,Matrix,numeric-method
###   solve,Matrix,pMatrix-method solve,Matrix,sparseVector-method
###   solve,MatrixFactorization,ANY-method
###   solve,MatrixFactorization,missing-method
###   solve,MatrixFactorization,numeric-method solve,pMatrix,matrix-method
###   solve,pMatrix,Matrix-method solve,pMatrix,missing-method
###   solve,sparseQR,ANY-method solve,TsparseMatrix,ANY-method
###   solve,TsparseMatrix,missing-method
### Keywords: methods

### ** Examples

## A close to symmetric example with "quite sparse" inverse:
n1 <- 7; n2 <- 3
dd <- data.frame(a = gl(n1,n2), b = gl(n2,1,n1*n2))# balanced 2-way
X <- sparse.model.matrix(~ -1+ a + b, dd)# no intercept --> even sparser
XXt <- tcrossprod(X)
diag(XXt) <- rep(c(0,0,1,0), length.out = nrow(XXt))

n <- nrow(ZZ <- kronecker(XXt, Diagonal(x=c(4,1))))
image(a <- 2*Diagonal(n) + ZZ %*% Diagonal(x=c(10, rep(1, n-1))))
isSymmetric(a) # FALSE
image(drop0(skewpart(a)))
image(ia0 <- solve(a)) # checker board, dense [but really, a is singular!]
try(solve(a, sparse=TRUE))##-> error [ TODO: assertError ]
ia. <- solve(a, sparse=TRUE, tol = 1e-19)##-> *no* error
if(R.version$arch == "x86_64")
  ## Fails on 32-bit [Fedora 19, R 3.0.2] from Matrix 1.1-0 on [FIXME ??] only
  stopifnot(all.equal(as.matrix(ia.), as.matrix(ia0)))
a <- a + Diagonal(n)
iad <- solve(a)
ias <- solve(a, sparse=TRUE)
stopifnot(all.equal(as(ias,"denseMatrix"), iad, tolerance=1e-14))
I. <- iad %*% a          ; image(I.)
I0 <- drop0(zapsmall(I.)); image(I0)
.I <- a %*% iad
.I0 <- drop0(zapsmall(.I))
stopifnot( all.equal(as(I0, "diagonalMatrix"), Diagonal(n)),
           all.equal(as(.I0,"diagonalMatrix"), Diagonal(n)) )




