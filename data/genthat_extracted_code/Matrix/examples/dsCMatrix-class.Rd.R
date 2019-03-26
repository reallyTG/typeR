library(Matrix)


### Name: dsCMatrix-class
### Title: Numeric Symmetric Sparse (column compressed) Matrices
### Aliases: dsCMatrix-class dsTMatrix-class t,dsCMatrix-method
###   t,dsTMatrix-method as.vector,dsCMatrix-method
###   coerce,dgeMatrix,dsCMatrix-method coerce,dgeMatrix,dsTMatrix-method
###   coerce,dsCMatrix,dgCMatrix-method coerce,dsCMatrix,dgTMatrix-method
###   coerce,dsCMatrix,dgeMatrix-method coerce,dsCMatrix,dsRMatrix-method
###   coerce,dsCMatrix,dsTMatrix-method coerce,dsCMatrix,dsyMatrix-method
###   coerce,dsCMatrix,lsCMatrix-method
###   coerce,dsCMatrix,generalMatrix-method
###   coerce,dsCMatrix,denseMatrix-method coerce,dsCMatrix,matrix-method
###   coerce,dsCMatrix,vector-method coerce,dsCMatrix,nsCMatrix-method
###   coerce,dsTMatrix,dgTMatrix-method coerce,dsTMatrix,dgeMatrix-method
###   coerce,dsTMatrix,dsCMatrix-method coerce,dsTMatrix,dsyMatrix-method
###   coerce,dsTMatrix,lsTMatrix-method coerce,dsTMatrix,matrix-method
###   coerce,dsyMatrix,dsCMatrix-method coerce,dsyMatrix,dsTMatrix-method
###   coerce,dtCMatrix,dtRMatrix-method coerce,matrix,dsCMatrix-method
###   coerce,matrix,dsTMatrix-method coerce,graphNEL,dsCMatrix-method
###   Arith,dsCMatrix,dsCMatrix-method determinant,dsCMatrix,missing-method
###   determinant,dsCMatrix,logical-method
### Keywords: classes algebra

### ** Examples

mm <- Matrix(toeplitz(c(10, 0, 1, 0, 3)), sparse = TRUE)
mm # automatically dsCMatrix
str(mm)

## how would we go from a manually constructed Tsparse* :
mT <- as(mm, "dgTMatrix")

## Either
(symM <- as(mT, "symmetricMatrix"))# dsT
(symC <- as(symM, "CsparseMatrix"))# dsC
## or
sC <- Matrix(mT, sparse=TRUE, forceCheck=TRUE)

sym2 <- as(symC, "TsparseMatrix")
## --> the same as 'symM', a "dsTMatrix"
## Don't show: 
stopifnot(identical(symC, sC), identical(sym2, symM),
          class(sym2) == "dsTMatrix",
	  identical(sym2[1,], sC[1,]),
	  identical(sym2[,2], sC[,2]))
## End(Don't show)



