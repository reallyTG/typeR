library(Matrix)


### Name: TsparseMatrix-class
### Title: Class "TsparseMatrix" of Sparse Matrices in Triplet Form
### Aliases: TsparseMatrix-class coerce,TsparseMatrix,CsparseMatrix-method
###   coerce,TsparseMatrix,lsparseMatrix-method
###   coerce,TsparseMatrix,lMatrix-method
###   coerce,TsparseMatrix,nsparseMatrix-method
###   coerce,TsparseMatrix,nMatrix-method
###   coerce,TsparseMatrix,matrix-method coerce,Matrix,TsparseMatrix-method
###   coerce,matrix,TsparseMatrix-method
###   coerce,numeric,TsparseMatrix-method t,TsparseMatrix-method
### Keywords: classes

### ** Examples

showClass("TsparseMatrix")
## or just the subclasses' names
names(getClass("TsparseMatrix")@subclasses)

T3 <- spMatrix(3,4, i=c(1,3:1), j=c(2,4:2), x=1:4)
T3 # only 3 non-zero entries, 5 = 1+4 !
## Don't show: 
stopifnot(nnzero(T3) == 3)
## End(Don't show)



