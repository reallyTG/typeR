library(sparseHessianFD)


### Name: Matrix.to.Coord
### Title: Row and column indices from sparse matrix.
### Aliases: Matrix.to.Coord

### ** Examples

M1 <- as(kronecker(diag(3), matrix(TRUE,2,2)),"sparseMatrix")
C <- Matrix.to.Coord(M1)
M2 <- Matrix::sparseMatrix(i=C$rows, j=C$cols)
all.equal(M1,M2)



