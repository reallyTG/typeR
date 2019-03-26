library(Matrix)


### Name: dsRMatrix-class
### Title: Symmetric Sparse Compressed Row Matrices
### Aliases: dsRMatrix-class
### Keywords: classes algebra

### ** Examples

(m0 <- new("dsRMatrix"))
m2 <- new("dsRMatrix", Dim = c(2L,2L),
          x = c(3,1), j = c(1L,1L), p = 0:2)
m2
stopifnot(colSums(as(m2, "TsparseMatrix")) == 3:4)
str(m2)
(ds2 <- forceSymmetric(diag(2))) # dsy*
dR <- as(ds2, "RsparseMatrix")
dR # dsRMatrix



