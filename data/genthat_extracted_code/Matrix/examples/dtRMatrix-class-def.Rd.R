library(Matrix)


### Name: dtRMatrix-class
### Title: Triangular Sparse Compressed Row Matrices
### Aliases: dtRMatrix-class
### Keywords: classes algebra

### ** Examples

(m0 <- new("dtRMatrix"))
(m2 <- new("dtRMatrix", Dim = c(2L,2L),
                        x = c(5, 1:2), p = c(0L,2:3), j= c(0:1,1L)))
str(m2)
(m3 <- as(Diagonal(2), "RsparseMatrix"))# --> dtRMatrix



