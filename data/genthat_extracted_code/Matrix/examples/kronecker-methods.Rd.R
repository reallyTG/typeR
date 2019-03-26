library(Matrix)


### Name: kronecker-methods
### Title: Methods for Function 'kronecker()' in Package 'Matrix'
### Aliases: kronecker-methods kronecker,ANY,Matrix-method
###   kronecker,ANY,diagonalMatrix-method kronecker,ANY,sparseMatrix-method
###   kronecker,Matrix,ANY-method kronecker,Matrix,diagonalMatrix-method
###   kronecker,diagonalMatrix,ANY-method
###   kronecker,diagonalMatrix,Matrix-method
###   kronecker,indMatrix,indMatrix-method
###   kronecker,sparseMatrix,ANY-method
###   kronecker,sparseMatrix,TsparseMatrix-method
###   kronecker,TsparseMatrix,sparseMatrix-method
###   kronecker,TsparseMatrix,TsparseMatrix-method
###   kronecker,dgTMatrix,dgTMatrix-method
###   kronecker,dgTMatrix,dtTMatrix-method
###   kronecker,dtTMatrix,dgTMatrix-method
###   kronecker,dtTMatrix,dtTMatrix-method
###   kronecker,dsparseMatrix,dsparseMatrix-method
### Keywords: methods array

### ** Examples

(t1 <- spMatrix(5,4, x= c(3,2,-7,11), i= 1:4, j=4:1)) #  5 x  4
(t2 <- kronecker(Diagonal(3, 2:4), t1))               # 15 x 12

## should also work with special-cased logical matrices
l3 <- upper.tri(matrix(,3,3))
M <- Matrix(l3)
(N <- as(M, "nsparseMatrix")) # "ntCMatrix" (upper triangular)
N2 <- as(N, "generalMatrix")  # (lost "t"riangularity)
MM <- kronecker(M,M)
NN <- kronecker(N,N) # "dtTMatrix" i.e. did keep
NN2 <- kronecker(N2,N2)
stopifnot(identical(NN,MM),
          is(NN2, "sparseMatrix"), all(NN2 == NN),
          is(NN, "triangularMatrix"))



