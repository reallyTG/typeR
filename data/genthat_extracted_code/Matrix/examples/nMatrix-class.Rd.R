library(Matrix)


### Name: nMatrix-class
### Title: Class "nMatrix" of Non-zero Pattern Matrices
### Aliases: nMatrix-class show,nMatrix-method coerce,matrix,nMatrix-method
###   coerce,nMatrix,matrix-method coerce,nMatrix,dMatrix-method
###   coerce,dMatrix,nMatrix-method coerce,nMatrix,lMatrix-method
###   coerce,lMatrix,nMatrix-method Arith,logical,nMatrix-method
###   Arith,nMatrix,logical-method Arith,nMatrix,numeric-method
###   Arith,numeric,nMatrix-method Compare,logical,nMatrix-method
###   Compare,nMatrix,logical-method Compare,nMatrix,nMatrix-method
###   Compare,nMatrix,numeric-method Compare,numeric,nMatrix-method
###   Logic,Matrix,nMatrix-method Logic,nMatrix,Matrix-method
###   Logic,nMatrix,nMatrix-method Logic,nMatrix,logical-method
###   Logic,nMatrix,numeric-method Logic,logical,nMatrix-method
###   Logic,numeric,nMatrix-method Ops,lMatrix,nMatrix-method
###   Ops,nMatrix,lMatrix-method Ops,nMatrix,numeric-method
###   Ops,numeric,nMatrix-method Summary,nMatrix-method
### Keywords: classes algebra

### ** Examples

getClass("nMatrix")

L3 <- Matrix(upper.tri(diag(3)))
L3 # an "ltCMatrix"
as(L3, "nMatrix") # -> ntC*

## similar, not using Matrix()
as(upper.tri(diag(3)), "nMatrix")# currently "ngTMatrix"



