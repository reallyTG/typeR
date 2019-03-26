library(Matrix)


### Name: band
### Title: Extract bands of a matrix
### Aliases: band-methods tril-methods triu-methods
###   band,CsparseMatrix-method tril,CsparseMatrix-method
###   triu,CsparseMatrix-method band,RsparseMatrix-method
###   tril,RsparseMatrix-method triu,RsparseMatrix-method
###   band,TsparseMatrix-method tril,TsparseMatrix-method
###   triu,TsparseMatrix-method tril,diagonalMatrix-method
###   triu,diagonalMatrix-method tril,dsCMatrix-method
###   tril,lsCMatrix-method tril,nsCMatrix-method triu,dsCMatrix-method
###   triu,lsCMatrix-method triu,nsCMatrix-method band,ddenseMatrix-method
###   tril,ddenseMatrix-method triu,ddenseMatrix-method
###   band,denseMatrix-method tril,denseMatrix-method
###   triu,denseMatrix-method band,matrix-method tril,matrix-method
###   triu,matrix-method tril,dtCMatrix-method tril,dtRMatrix-method
###   tril,dtTMatrix-method tril,dtpMatrix-method tril,dtrMatrix-method
###   tril,ltCMatrix-method tril,ltRMatrix-method tril,ltTMatrix-method
###   tril,ltpMatrix-method tril,ltrMatrix-method tril,ntCMatrix-method
###   tril,ntRMatrix-method tril,ntTMatrix-method tril,ntpMatrix-method
###   tril,ntrMatrix-method tril,itTMatrix-method tril,itCMatrix-method
###   tril,itRMatrix-method triu,dtCMatrix-method triu,dtRMatrix-method
###   triu,dtTMatrix-method triu,dtpMatrix-method triu,dtrMatrix-method
###   triu,ltCMatrix-method triu,ltRMatrix-method triu,ltTMatrix-method
###   triu,ltpMatrix-method triu,ltrMatrix-method triu,ntCMatrix-method
###   triu,ntRMatrix-method triu,ntTMatrix-method triu,ntpMatrix-method
###   triu,ntrMatrix-method triu,itTMatrix-method triu,itCMatrix-method
###   triu,itRMatrix-method band tril triu
### Keywords: methods algebra

### ** Examples

## A random sparse matrix :
set.seed(7)
m <- matrix(0, 5, 5)
m[sample(length(m), size = 14)] <- rep(1:9, length=14)
(mm <- as(m, "CsparseMatrix"))

tril(mm)        # lower triangle
tril(mm, -1)    # strict lower triangle
triu(mm,  1)    # strict upper triangle
band(mm, -1, 2) # general band
(m5 <- Matrix(rnorm(25), nc = 5))
tril(m5)        # lower triangle
tril(m5, -1)    # strict lower triangle
triu(m5, 1)     # strict upper triangle
band(m5, -1, 2) # general band
(m65 <- Matrix(rnorm(30), nc = 5))  # not square
triu(m65)       # result in not dtrMatrix unless square
(sm5 <- crossprod(m65)) # symmetric
   band(sm5, -1, 1)# symmetric band preserves symmetry property
as(band(sm5, -1, 1), "sparseMatrix")# often preferable
## Don't show: 
 ## this uses special methods
(x.x <- crossprod(mm))
tril(x.x)
xx <- tril(x.x) + triu(x.x, 1) ## the same as x.x (but stored differently):
txx <- t(as(xx, "symmetricMatrix"))
stopifnot(identical(triu(x.x), t(tril(x.x))),
	  identical(class(x.x), class(txx)),
	  identical(as(x.x, "generalMatrix"), as(txx, "generalMatrix")))
## End(Don't show)



