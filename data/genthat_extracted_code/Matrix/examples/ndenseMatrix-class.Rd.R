library(Matrix)


### Name: ndenseMatrix-class
### Title: Virtual Class "ndenseMatrix" of Dense Logical Matrices
### Aliases: ndenseMatrix-class !,ndenseMatrix-method
###   Ops,ndenseMatrix,ndenseMatrix-method Summary,ndenseMatrix-method
###   as.logical,ndenseMatrix-method coerce,matrix,ndenseMatrix-method
###   coerce,ndenseMatrix,matrix-method
###   coerce,ndenseMatrix,CsparseMatrix-method
###   coerce,ndenseMatrix,TsparseMatrix-method
###   coerce,ndenseMatrix,ldenseMatrix-method
###   coerce,ndenseMatrix,sparseMatrix-method
###   coerce,ndenseMatrix,nsparseMatrix-method
###   coerce,ngeMatrix,lgeMatrix-method coerce,nspMatrix,lspMatrix-method
###   coerce,nsyMatrix,lsyMatrix-method coerce,ntpMatrix,ltpMatrix-method
###   coerce,ntrMatrix,ltrMatrix-method as.vector,ndenseMatrix-method
###   diag,ndenseMatrix-method norm,ndenseMatrix,character-method
###   which,ndenseMatrix-method
### Keywords: classes

### ** Examples

showClass("ndenseMatrix")

as(diag(3) > 0, "ndenseMatrix")# -> "nge"



