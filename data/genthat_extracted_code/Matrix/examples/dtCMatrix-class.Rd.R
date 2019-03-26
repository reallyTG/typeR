library(Matrix)


### Name: dtCMatrix-class
### Title: Triangular, (compressed) sparse column matrices
### Aliases: dtCMatrix-class dtTMatrix-class
###   coerce,dtCMatrix,dgCMatrix-method coerce,dtCMatrix,dgeMatrix-method
###   coerce,dtCMatrix,dgTMatrix-method coerce,dtCMatrix,dsCMatrix-method
###   coerce,dtCMatrix,dtTMatrix-method coerce,dtCMatrix,dtrMatrix-method
###   coerce,dtCMatrix,ltCMatrix-method coerce,dtCMatrix,ntCMatrix-method
###   coerce,dtCMatrix,TsparseMatrix-method
###   coerce,dtCMatrix,denseMatrix-method coerce,dtCMatrix,matrix-method
###   coerce,dtTMatrix,dgTMatrix-method coerce,dtTMatrix,dgeMatrix-method
###   coerce,dtTMatrix,dtCMatrix-method coerce,dtTMatrix,dtrMatrix-method
###   coerce,dtTMatrix,generalMatrix-method coerce,dtTMatrix,matrix-method
###   coerce,matrix,dtCMatrix-method coerce,matrix,dtTMatrix-method
###   Arith,dtCMatrix,dtCMatrix-method t,dtCMatrix-method
###   t,dtTMatrix-method
### Keywords: classes algebra

### ** Examples

showClass("dtCMatrix")

showClass("dtTMatrix")
t1 <- new("dtTMatrix", x= c(3,7), i= 0:1, j=3:2, Dim= as.integer(c(4,4)))
t1
## from  0-diagonal to unit-diagonal {low-level step}:
tu <- t1 ; tu@diag <- "U"
tu
(cu <- as(tu, "dtCMatrix"))
str(cu)# only two entries in @i and @x
stopifnot(cu@i == 1:0,
          all(2 * symmpart(cu) == Diagonal(4) + forceSymmetric(cu)))

t1[1,2:3] <- -1:-2
diag(t1) <- 10*c(1:2,3:2)
t1 # still triangular
(it1 <- solve(t1))
t1. <- solve(it1)
all(abs(t1 - t1.) < 10 * .Machine$double.eps)

## 2nd example
U5 <- new("dtCMatrix", i= c(1L, 0:3), p=c(0L,0L,0:2, 5L), Dim = c(5L, 5L),
          x = rep(1, 5), diag = "U")
U5
(iu <- solve(U5)) # contains one '0'
validObject(iu2 <- solve(U5, Diagonal(5)))# failed in earlier versions

I5 <- iu  %*% U5 # should equal the identity matrix
i5 <- iu2 %*% U5
m53 <- matrix(1:15, 5,3, dimnames=list(NULL,letters[1:3]))
asDiag <- function(M) as(drop0(M), "diagonalMatrix")
stopifnot(
   all.equal(Diagonal(5), asDiag(I5), tolerance=1e-14) ,
   all.equal(Diagonal(5), asDiag(i5), tolerance=1e-14) ,
   identical(list(NULL, dimnames(m53)[[2]]), dimnames(solve(U5, m53)))
)
## Don't show: 
i5. <- I5; colnames(i5.) <- LETTERS[11:15]
M53 <- as(m53, "dgeMatrix")
stopifnot(
   identical((dns <- dimnames(solve(i5., M53))),
             dimnames(solve(as.matrix(i5.), as.matrix(M53)))) ,
   identical(dns, dimnames(solve(i5., as.matrix(M53))))
)
## End(Don't show)



