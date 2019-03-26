library(Matrix)


### Name: chol2inv-methods
### Title: Inverse from Choleski or QR Decomposition - Matrix Methods
### Aliases: chol2inv-methods chol2inv,ANY-method chol2inv,dtrMatrix-method
###   chol2inv,CHMfactor-method chol2inv,denseMatrix-method
###   chol2inv,sparseMatrix-method
### Keywords: methods algebra

### ** Examples

(M  <- Matrix(cbind(1, 1:3, c(1,3,7))))
(cM <- chol(M)) # a "Cholesky" object, inheriting from "dtrMatrix"
chol2inv(cM) %*% M # the identity
stopifnot(all(chol2inv(cM) %*% M - Diagonal(nrow(M))) < 1e-10)



