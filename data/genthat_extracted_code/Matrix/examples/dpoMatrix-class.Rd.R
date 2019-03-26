library(Matrix)


### Name: dpoMatrix-class
### Title: Positive Semi-definite Dense (Packed | Non-packed) Numeric
###   Matrices
### Aliases: dpoMatrix-class dppMatrix-class corMatrix-class
###   coerce,dpoMatrix,corMatrix-method coerce,dpoMatrix,dppMatrix-method
###   coerce,dpoMatrix,lMatrix-method coerce,dpoMatrix,nMatrix-method
###   coerce,dppMatrix,lMatrix-method coerce,dppMatrix,nMatrix-method
###   coerce,dppMatrix,sparseMatrix-method
###   coerce,dppMatrix,CsparseMatrix-method
###   coerce,dppMatrix,dpoMatrix-method coerce,dspMatrix,dpoMatrix-method
###   coerce,dspMatrix,dppMatrix-method coerce,matrix,corMatrix-method
###   coerce,Matrix,corMatrix-method coerce,matrix,dpoMatrix-method
###   coerce,Matrix,dpoMatrix-method coerce,matrix,dppMatrix-method
###   coerce,Matrix,dppMatrix-method Ops,dpoMatrix,logical-method
###   Ops,dpoMatrix,numeric-method Ops,dppMatrix,logical-method
###   Ops,dppMatrix,numeric-method Ops,logical,dpoMatrix-method
###   Ops,logical,dppMatrix-method Ops,numeric,dpoMatrix-method
###   Ops,numeric,dppMatrix-method Arith,dpoMatrix,logical-method
###   Arith,dpoMatrix,numeric-method Arith,dppMatrix,logical-method
###   Arith,dppMatrix,numeric-method Arith,logical,dpoMatrix-method
###   Arith,logical,dppMatrix-method Arith,numeric,dpoMatrix-method
###   Arith,numeric,dppMatrix-method rcond,dpoMatrix,character-method
###   rcond,dppMatrix,character-method rcond,dpoMatrix,missing-method
###   rcond,dppMatrix,missing-method determinant,dpoMatrix,logical-method
###   determinant,dppMatrix,logical-method
###   determinant,dpoMatrix,missing-method
###   determinant,dppMatrix,missing-method t,dppMatrix-method
### Keywords: classes algebra

### ** Examples

h6 <- Hilbert(6)
rcond(h6)
str(h6)
h6 * 27720 # is ``integer''
solve(h6)
str(hp6 <- as(h6, "dppMatrix"))

### Note that  as(*, "corMatrix")  *scales* the matrix
(ch6 <- as(h6, "corMatrix"))
stopifnot(all.equal(h6 * 27720, round(27720 * h6), tolerance = 1e-14),
          all.equal(ch6@sd^(-2), 2*(1:6)-1, tolerance= 1e-12))
chch <- chol(ch6)
stopifnot(identical(chch, ch6@factors$Cholesky),
          all(abs(crossprod(chch) - ch6) < 1e-10))



