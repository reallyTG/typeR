library(Matrix)


### Name: dMatrix-class
### Title: (Virtual) Class "dMatrix" of "double" Matrices
### Aliases: dMatrix-class lMatrix-class show,dMatrix-method
###   coerce,dMatrix,lMatrix-method coerce,lMatrix,dMatrix-method
###   coerce,lMatrix,dgCMatrix-method coerce,matrix,lMatrix-method
###   [,dMatrix,lMatrix,missing,ANY-method
###   [,dMatrix,logical,missing,ANY-method Ops,dMatrix,dMatrix-method
###   Ops,dMatrix,lMatrix-method Ops,dMatrix,nMatrix-method
###   Ops,lMatrix,dMatrix-method Ops,lMatrix,lMatrix-method
###   Ops,lMatrix,numeric-method Ops,nMatrix,dMatrix-method
###   Ops,numeric,lMatrix-method Arith,dMatrix,dMatrix-method
###   Arith,lMatrix,logical-method Arith,lMatrix,numeric-method
###   Arith,logical,lMatrix-method Arith,numeric,lMatrix-method
###   Compare,dMatrix,logical-method Compare,dMatrix,numeric-method
###   Compare,lMatrix,logical-method Compare,lMatrix,numeric-method
###   Compare,logical,dMatrix-method Compare,logical,lMatrix-method
###   Compare,numeric,dMatrix-method Compare,numeric,lMatrix-method
###   Logic,dMatrix,logical-method Logic,dMatrix,numeric-method
###   Logic,lMatrix,logical-method Logic,lMatrix,numeric-method
###   Logic,logical,dMatrix-method Logic,logical,lMatrix-method
###   Logic,numeric,dMatrix-method Logic,numeric,lMatrix-method
###   Summary,lMatrix-method Math2,dMatrix-method log,dMatrix-method
###   gamma,dMatrix-method lgamma,dMatrix-method zapsmall,dMatrix-method
###   which,lMatrix-method
### Keywords: classes algebra

### ** Examples

 showClass("dMatrix")

 set.seed(101)
 round(Matrix(rnorm(28), 4,7), 2)
 M <- Matrix(rlnorm(56, sd=10), 4,14)
 (M. <- zapsmall(M))
 table(as.logical(M. == 0))



