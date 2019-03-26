library(Matrix)


### Name: dtpMatrix-class
### Title: Packed Triangular Dense Matrices - "dtpMatrix"
### Aliases: dtpMatrix-class coerce,dtpMatrix,dtTMatrix-method
###   coerce,dtpMatrix,dtrMatrix-method coerce,dtpMatrix,ltpMatrix-method
###   coerce,dtpMatrix,matrix-method coerce,matrix,dtpMatrix-method
###   determinant,dtpMatrix,missing-method
###   determinant,dtpMatrix,logical-method diag,dtpMatrix-method
###   diag<-,dtpMatrix-method norm,dtpMatrix,character-method
###   norm,dtpMatrix,missing-method rcond,dtpMatrix,character-method
###   rcond,dtpMatrix,missing-method t,dtpMatrix-method
### Keywords: classes

### ** Examples

showClass("dtrMatrix")

example("dtrMatrix-class", echo=FALSE)
(p1 <- as(T2, "dtpMatrix"))
str(p1)
(pp <- as(T, "dtpMatrix"))
ip1 <- solve(p1)
stopifnot(length(p1@x) == 3, length(pp@x) == 3,
          p1 @ uplo == T2 @ uplo, pp @ uplo == T @ uplo,
	  identical(t(pp), p1), identical(t(p1), pp),
	  all((l.d <- p1 - T2) == 0), is(l.d, "dtpMatrix"),
	  all((u.d <- pp - T ) == 0), is(u.d, "dtpMatrix"),
	  l.d@uplo == T2@uplo, u.d@uplo == T@uplo,
	  identical(t(ip1), solve(pp)), is(ip1, "dtpMatrix"),
	  all.equal(as(solve(p1,p1), "diagonalMatrix"), Diagonal(2)))



