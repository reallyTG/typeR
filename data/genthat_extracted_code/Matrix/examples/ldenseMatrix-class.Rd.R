library(Matrix)


### Name: ldenseMatrix-class
### Title: Virtual Class "ldenseMatrix" of Dense Logical Matrices
### Aliases: ldenseMatrix-class !,ldenseMatrix-method
###   Ops,ldenseMatrix,ldenseMatrix-method
###   Logic,ldenseMatrix,lsparseMatrix-method
###   Logic,lsparseMatrix,ldenseMatrix-method Summary,ldenseMatrix-method
###   as.logical,ldenseMatrix-method as.vector,ldenseMatrix-method
###   coerce,matrix,ldenseMatrix-method coerce,ldenseMatrix,matrix-method
###   diag,ldenseMatrix-method norm,ldenseMatrix,character-method
###   which,ldenseMatrix-method
### Keywords: classes

### ** Examples

showClass("ldenseMatrix")

as(diag(3) > 0, "ldenseMatrix")



