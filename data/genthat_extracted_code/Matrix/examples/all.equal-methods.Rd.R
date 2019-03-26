library(Matrix)


### Name: all.equal-methods
### Title: Matrix Package Methods for Function all.equal()
### Aliases: all.equal-methods all.equal,Matrix,Matrix-method
###   all.equal,Matrix,ANY-method all.equal,ANY,Matrix-method
###   all.equal,sparseMatrix,sparseMatrix-method
###   all.equal,sparseMatrix,ANY-method all.equal,ANY,sparseMatrix-method
###   all.equal,sparseVector,sparseVector-method
###   all.equal,sparseMatrix,sparseVector-method
###   all.equal,sparseVector,sparseMatrix-method
###   all.equal,sparseVector,ANY-method all.equal,ANY,sparseVector-method
###   all.equal,abIndex,abIndex-method all.equal,abIndex,numLike-method
###   all.equal,numLike,abIndex-method
### Keywords: methods arith

### ** Examples

showMethods("all.equal")

(A <- spMatrix(3,3, i= c(1:3,2:1), j=c(3:1,1:2), x = 1:5))
ex <- expand(lu. <- lu(A))
stopifnot( all.equal(as(A[lu.@p + 1L, lu.@q + 1L], "CsparseMatrix"),
                     lu.@L %*% lu.@U),
           with(ex, all.equal(as(P %*% A %*% Q, "CsparseMatrix"),
                              L %*% U)),
           with(ex, all.equal(as(A, "CsparseMatrix"),
                              t(P) %*% L %*% U %*% t(Q))))



