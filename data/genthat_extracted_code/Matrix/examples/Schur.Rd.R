library(Matrix)


### Name: Schur
### Title: Schur Decomposition of a Matrix
### Aliases: Schur Schur,dgeMatrix,logical-method
###   Schur,dgeMatrix,missing-method Schur,diagonalMatrix,logical-method
###   Schur,diagonalMatrix,missing-method
###   Schur,triangularMatrix,logical-method
###   Schur,triangularMatrix,missing-method Schur,dsyMatrix,ANY-method
###   Schur,generalMatrix,logical-method Schur,generalMatrix,missing-method
###   Schur,symmetricMatrix,logical-method
###   Schur,symmetricMatrix,missing-method Schur,matrix,logical-method
###   Schur,matrix,missing-method
### Keywords: algebra

### ** Examples

Schur(Hilbert(9))              # Schur factorization (real eigenvalues)

(A <- Matrix(round(rnorm(5*5, sd = 100)), nrow = 5))
(Sch.A <- Schur(A))

eTA <- eigen(Sch.A@T)
str(SchA <- Schur(A, vectors=FALSE))# no 'T' ==> simple list
stopifnot(all.equal(eTA$values, eigen(A)$values, tolerance = 1e-13),
          all.equal(eTA$values,
                    local({z <- Sch.A@EValues
                           z[order(Mod(z), decreasing=TRUE)]}), tolerance = 1e-13),
          identical(SchA$T, Sch.A@T),
          identical(SchA$EValues, Sch.A@EValues))

## For the faint of heart, we provide Schur() also for traditional matrices:

a.m <- function(M) unname(as(M, "matrix"))
a <- a.m(A)
Sch.a <- Schur(a)
stopifnot(identical(Sch.a, list(Q = a.m(Sch.A @ Q),
				T = a.m(Sch.A @ T),
				EValues = Sch.A@EValues)),
	  all.equal(a, with(Sch.a, Q %*% T %*% t(Q)))
)



