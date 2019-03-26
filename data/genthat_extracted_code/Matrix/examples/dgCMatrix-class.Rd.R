library(Matrix)


### Name: dgCMatrix-class
### Title: Compressed, sparse, column-oriented numeric matrices
### Aliases: dgCMatrix-class as.vector,dgCMatrix-method
###   coerce,matrix,dgCMatrix-method coerce,dgeMatrix,dgCMatrix-method
###   coerce,dgCMatrix,dgTMatrix-method coerce,dgCMatrix,dsCMatrix-method
###   coerce,dgCMatrix,dtCMatrix-method coerce,dgCMatrix,lgCMatrix-method
###   coerce,dgCMatrix,ngCMatrix-method coerce,dgCMatrix,dgeMatrix-method
###   coerce,dgCMatrix,matrix-method coerce,dgCMatrix,vector-method
###   coerce,factor,dgCMatrix-method diag,dgCMatrix-method
###   dim,dgCMatrix-method isSymmetric,dgCMatrix-method t,dgCMatrix-method
###   Arith,logical,dgCMatrix-method Arith,numeric,dgCMatrix-method
###   Arith,dgCMatrix,logical-method Arith,dgCMatrix,numeric-method
###   Arith,dgCMatrix,dgCMatrix-method Math,dgCMatrix-method
###   round,dgCMatrix,numeric-method signif,dgCMatrix,numeric-method
###   log,dgCMatrix-method gamma,dgCMatrix-method lgamma,dgCMatrix-method
### Keywords: classes algebra

### ** Examples

(m <- Matrix(c(0,0,2:0), 3,5))
str(m)
m[,1]
## Don't show: 
## regression test: this must give a validity-check error:
stopifnot(inherits(try(new("dgCMatrix", i = 0:1, p = 0:2,
                           x = c(2,3), Dim = 3:4)),
          "try-error"))
## End(Don't show)



