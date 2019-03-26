library(Matrix)


### Name: dtrMatrix-class
### Title: Triangular, dense, numeric matrices
### Aliases: coerce,dgeMatrix,dtrMatrix-method
###   coerce,dtrMatrix,dtpMatrix-method coerce,dtrMatrix,ltrMatrix-method
###   coerce,dtrMatrix,matrix-method coerce,dtrMatrix,sparseMatrix-method
###   coerce,dtrMatrix,CsparseMatrix-method coerce,matrix,dtrMatrix-method
###   determinant,dtrMatrix,logical-method
###   determinant,dtrMatrix,missing-method diag,dtrMatrix-method
###   diag<-,dtrMatrix-method norm,dtrMatrix,character-method
###   norm,dtrMatrix,missing-method rcond,dtrMatrix,character-method
###   rcond,dtrMatrix,missing-method show,dtrMatrix-method
###   t,dtrMatrix-method dtrMatrix-class
### Keywords: classes

### ** Examples

(m <- rbind(2:3, 0:-1))
(M <- as(m, "dgeMatrix"))

(T <- as(M, "dtrMatrix")) ## upper triangular is default
(T2 <- as(t(M), "dtrMatrix"))
stopifnot(T@uplo == "U", T2@uplo == "L", identical(T2, t(T)))



