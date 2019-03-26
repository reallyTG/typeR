library(Matrix)


### Name: lgeMatrix-class
### Title: Class "lgeMatrix" of General Dense Logical Matrices
### Aliases: lgeMatrix-class !,lgeMatrix-method
###   Arith,lgeMatrix,lgeMatrix-method Compare,lgeMatrix,lgeMatrix-method
###   Logic,lgeMatrix,lgeMatrix-method as.vector,lgeMatrix-method
###   coerce,matrix,lgeMatrix-method coerce,lgeMatrix,dgeMatrix-method
###   coerce,lgeMatrix,matrix-method coerce,lgeMatrix,lgCMatrix-method
###   coerce,lgeMatrix,lgTMatrix-method coerce,lgeMatrix,lsyMatrix-method
###   coerce,lgeMatrix,ltrMatrix-method coerce,lgeMatrix,ltpMatrix-method
###   coerce,lgeMatrix,lspMatrix-method diag,lgeMatrix-method
###   diag<-,lgeMatrix-method t,lgeMatrix-method
### Keywords: classes

### ** Examples

showClass("lgeMatrix")
str(new("lgeMatrix"))
set.seed(1)
(lM <- Matrix(matrix(rnorm(28), 4,7) > 0))# a simple random lgeMatrix
set.seed(11)
(lC <- Matrix(matrix(rnorm(28), 4,7) > 0))# a simple random lgCMatrix
as(lM, "lgCMatrix")



