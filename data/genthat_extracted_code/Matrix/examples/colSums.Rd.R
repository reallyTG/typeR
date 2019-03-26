library(Matrix)


### Name: colSums
### Title: Form Row and Column Sums and Means
### Aliases: colSums colMeans rowSums rowMeans
###   colMeans,diagonalMatrix-method colSums,diagonalMatrix-method
###   rowMeans,diagonalMatrix-method rowSums,diagonalMatrix-method
###   colMeans,CsparseMatrix-method colSums,CsparseMatrix-method
###   rowMeans,CsparseMatrix-method rowSums,CsparseMatrix-method
###   colMeans,TsparseMatrix-method colSums,TsparseMatrix-method
###   rowMeans,TsparseMatrix-method rowSums,TsparseMatrix-method
###   colMeans,RsparseMatrix-method colSums,RsparseMatrix-method
###   rowMeans,RsparseMatrix-method rowSums,RsparseMatrix-method
###   colMeans,dgCMatrix-method colSums,dgCMatrix-method
###   rowMeans,dgCMatrix-method rowSums,dgCMatrix-method
###   colMeans,igCMatrix-method colSums,igCMatrix-method
###   rowMeans,igCMatrix-method rowSums,igCMatrix-method
###   colMeans,lgCMatrix-method colSums,lgCMatrix-method
###   rowMeans,lgCMatrix-method rowSums,lgCMatrix-method
###   colMeans,ngCMatrix-method colSums,ngCMatrix-method
###   rowMeans,ngCMatrix-method rowSums,ngCMatrix-method
###   colMeans,denseMatrix-method colSums,denseMatrix-method
###   rowMeans,denseMatrix-method rowSums,denseMatrix-method
###   colMeans,ddenseMatrix-method colSums,ddenseMatrix-method
###   rowMeans,ddenseMatrix-method rowSums,ddenseMatrix-method
### Keywords: array algebra arith

### ** Examples

(M <- bdiag(Diagonal(2), matrix(1:3, 3,4), diag(3:2))) # 7 x 8
colSums(M)
d <- Diagonal(10, c(0,0,10,0,2,rep(0,5)))
MM <- kronecker(d, M)
dim(MM) # 70 80
length(MM@x) # 160, but many are '0' ; drop those:
MM <- drop0(MM)
length(MM@x) # 32
  cm <- colSums(MM)
(scm <- colSums(MM, sparseResult = TRUE))
stopifnot(is(scm, "sparseVector"),
          identical(cm, as.numeric(scm)))
rowSums (MM, sparseResult = TRUE) # 14 of 70 are not zero
colMeans(MM, sparseResult = TRUE) # 16 of 80 are not zero
## Since we have no 'NA's, these two are equivalent :
stopifnot(identical(rowMeans(MM, sparseResult = TRUE),
                    rowMeans(MM, sparseResult = TRUE, na.rm = TRUE)),
	  rowMeans(Diagonal(16)) == 1/16,
	  colSums(Diagonal(7)) == 1)

## dimnames(x) -->  names( <value> ) :
dimnames(M) <- list(paste0("r", 1:7), paste0("V",1:8))
M
colSums(M)
rowMeans(M)
## Assertions :
stopifnot(all.equal(colSums(M),
		    setNames(c(1,1,6,6,6,6,3,2), colnames(M))),
	  all.equal(rowMeans(M), structure(c(1,1,4,8,12,3,2) / 8,
					   .Names = paste0("r", 1:7))))



