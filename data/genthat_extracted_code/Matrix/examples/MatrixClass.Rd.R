library(Matrix)


### Name: MatrixClass
### Title: The Matrix (Super-) Class of a Class
### Aliases: MatrixClass
### Keywords: classes

### ** Examples

mkA <- setClass("A", contains="dgCMatrix")
(A <- mkA())
stopifnot(identical(
     MatrixClass("A"),
     "dgCMatrix"))



