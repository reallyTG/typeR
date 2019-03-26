library(Matrix)


### Name: sparseMatrix-class
### Title: Virtual Class "sparseMatrix" - Mother of Sparse Matrices
### Aliases: sparseMatrix-class Math,sparseMatrix-method
###   Ops,sparseMatrix,sparseMatrix-method Ops,sparseMatrix,numeric-method
###   Ops,numeric,sparseMatrix-method
###   Ops,diagonalMatrix,sparseMatrix-method
###   Ops,sparseMatrix,diagonalMatrix-method
###   cbind2,sparseMatrix,sparseMatrix-method
###   cbind2,denseMatrix,sparseMatrix-method
###   cbind2,sparseMatrix,denseMatrix-method
###   cbind2,sparseMatrix,matrix-method cbind2,matrix,sparseMatrix-method
###   cbind2,sparseMatrix,numeric-method cbind2,numeric,sparseMatrix-method
###   rbind2,sparseMatrix,sparseMatrix-method
###   rbind2,denseMatrix,sparseMatrix-method
###   rbind2,sparseMatrix,denseMatrix-method
###   rbind2,sparseMatrix,matrix-method rbind2,matrix,sparseMatrix-method
###   rbind2,sparseMatrix,numeric-method rbind2,numeric,sparseMatrix-method
###   coerce,ANY,sparseMatrix-method coerce,table,sparseMatrix-method
###   coerce,factor,sparseMatrix-method
###   coerce,sparseMatrix,generalMatrix-method
###   coerce,sparseMatrix,symmetricMatrix-method
###   coerce,sparseMatrix,triangularMatrix-method
###   -,sparseMatrix,missing-method cov2cor,sparseMatrix-method
###   diag,sparseMatrix-method dim<-,sparseMatrix-method
###   format,sparseMatrix-method lu,sparseMatrix-method
###   mean,sparseMatrix-method print,sparseMatrix-method
###   show,sparseMatrix-method summary,sparseMatrix-method
###   norm,sparseMatrix,character-method
###   determinant,dgCMatrix,logical-method
###   determinant,dsparseMatrix,logical-method
###   determinant,dtCMatrix,logical-method
###   determinant,sparseMatrix,missing-method
###   determinant,sparseMatrix,logical-method rep,sparseMatrix-method
###   print.sparseMatrix
### Keywords: classes

### ** Examples

showClass("sparseMatrix") ## and look at the help() of its subclasses
M <- Matrix(0, 10000, 100)
M[1,1] <- M[2,3] <- 3.14
M  ## show(.) method suppresses printing of the majority of rows

data(CAex); dim(CAex) # 72 x 72 matrix
determinant(CAex) # works via sparse lu(.)

## factor -> t( <sparse design matrix> ) :
(fact <- gl(5, 3, 30, labels = LETTERS[1:5]))
(Xt <- as(fact, "sparseMatrix"))  # indicator rows

## missing values --> all-0 columns:
f.mis <- fact
i.mis <- c(3:5, 17)
is.na(f.mis) <- i.mis
Xt != (X. <- as(f.mis, "sparseMatrix")) # differ only in columns 3:5,17
stopifnot(all(X.[,i.mis] == 0), all(Xt[,-i.mis] == X.[,-i.mis]))



