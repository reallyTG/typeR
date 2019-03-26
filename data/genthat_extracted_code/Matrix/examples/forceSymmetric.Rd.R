library(Matrix)


### Name: forceSymmetric
### Title: Force a Matrix to 'symmetricMatrix' Without Symmetry Checks
### Aliases: forceSymmetric forceSymmetric,matrix,ANY-method
###   forceSymmetric,Matrix,missing-method
###   forceSymmetric,denseMatrix,character-method
###   forceSymmetric,denseMatrix,missing-method
###   forceSymmetric,sparseMatrix,ANY-method
###   forceSymmetric,CsparseMatrix,ANY-method
###   forceSymmetric,dsyMatrix,missing-method
###   forceSymmetric,dsyMatrix,character-method
###   forceSymmetric,dspMatrix,missing-method
###   forceSymmetric,dspMatrix,character-method
###   forceSymmetric,lsyMatrix,missing-method
###   forceSymmetric,lsyMatrix,character-method
###   forceSymmetric,lspMatrix,missing-method
###   forceSymmetric,lspMatrix,character-method
###   forceSymmetric,nsyMatrix,missing-method
###   forceSymmetric,nsyMatrix,character-method
###   forceSymmetric,nspMatrix,missing-method
###   forceSymmetric,nspMatrix,character-method
###   forceSymmetric,dsTMatrix,missing-method
###   forceSymmetric,dsTMatrix,character-method
###   forceSymmetric,dsCMatrix,missing-method
###   forceSymmetric,dsCMatrix,character-method
###   forceSymmetric,dsRMatrix,missing-method
###   forceSymmetric,dsRMatrix,character-method
###   forceSymmetric,lsTMatrix,missing-method
###   forceSymmetric,lsTMatrix,character-method
###   forceSymmetric,lsCMatrix,missing-method
###   forceSymmetric,lsCMatrix,character-method
###   forceSymmetric,lsRMatrix,missing-method
###   forceSymmetric,lsRMatrix,character-method
###   forceSymmetric,nsTMatrix,missing-method
###   forceSymmetric,nsTMatrix,character-method
###   forceSymmetric,nsCMatrix,missing-method
###   forceSymmetric,nsCMatrix,character-method
###   forceSymmetric,nsRMatrix,missing-method
###   forceSymmetric,nsRMatrix,character-method
###   forceSymmetric,dpoMatrix,missing-method
###   forceSymmetric,dpoMatrix,character-method
###   forceSymmetric,corMatrix,missing-method
###   forceSymmetric,corMatrix,character-method
###   forceSymmetric,dppMatrix,missing-method
###   forceSymmetric,dppMatrix,character-method
### Keywords: array

### ** Examples

 ## Hilbert matrix
 i <- 1:6
 h6 <- 1/outer(i - 1L, i, "+")
 sd <- sqrt(diag(h6))
 hh <- t(h6/sd)/sd # theoretically symmetric
 isSymmetric(hh, tol=0) # FALSE; hence
 try( as(hh, "symmetricMatrix") ) # fails, but this works fine:
 H6 <- forceSymmetric(hh)

 ## result can be pretty surprising:
 (M <- Matrix(1:36, 6))
 forceSymmetric(M) # symmetric, hence very different in lower triangle
 (tm <- tril(M))
 forceSymmetric(tm)



