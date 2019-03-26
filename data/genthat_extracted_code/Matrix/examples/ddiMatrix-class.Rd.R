library(Matrix)


### Name: ddiMatrix-class
### Title: Class "ddiMatrix" of Diagonal Numeric Matrices
### Aliases: ddiMatrix-class
### Keywords: classes

### ** Examples

(d2 <- Diagonal(x = c(10,1)))
str(d2)
## slightly larger in internal size:
str(as(d2, "sparseMatrix"))

M <- Matrix(cbind(1,2:4))
M %*% d2 #> `fast' multiplication

chol(d2) # trivial
stopifnot(is(cd2 <- chol(d2), "ddiMatrix"),
          all.equal(cd2@x, c(sqrt(10),1)))



