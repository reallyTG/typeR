library(Matrix)


### Name: symmpart
### Title: Symmetric Part and Skew(symmetric) Part of a Matrix
### Aliases: symmpart skewpart symmpart-methods skewpart-methods
###   symmpart,Matrix-method skewpart,Matrix-method
###   symmpart,diagonalMatrix-method skewpart,diagonalMatrix-method
###   symmpart,ddenseMatrix-method skewpart,ddenseMatrix-method
###   symmpart,denseMatrix-method skewpart,denseMatrix-method
###   symmpart,symmetricMatrix-method skewpart,symmetricMatrix-method
###   symmpart,matrix-method skewpart,matrix-method
### Keywords: array arith

### ** Examples

m <- Matrix(1:4, 2,2)
symmpart(m)
skewpart(m)

stopifnot(all(m == symmpart(m) + skewpart(m)))

dn <- dimnames(m) <- list(row = c("r1", "r2"), col = c("var.1", "var.2"))
stopifnot(all(m == symmpart(m) + skewpart(m)))
colnames(m) <- NULL
stopifnot(all(m == symmpart(m) + skewpart(m)))
dimnames(m) <- unname(dn)
stopifnot(all(m == symmpart(m) + skewpart(m)))


## investigate the current methods:
showMethods(skewpart, include = TRUE)



