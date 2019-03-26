library(e1071)


### Name: read.matrix.csr
### Title: Read/Write Sparse Data
### Aliases: read.matrix.csr write.matrix.csr
### Keywords: IO

### ** Examples

## Not run: 
##D library(methods)
##D if (require(SparseM)) {
##D     data(iris)
##D     x <- as.matrix(iris[,1:4])
##D     y <- iris[,5]
##D     xs <- as.matrix.csr(x)
##D     write.matrix.csr(xs, y = y, file = "iris.dat")
##D     xs2 <- read.matrix.csr("iris.dat")$x
##D     if (!all(as.matrix(xs) == as.matrix(xs2)))
##D         stop("Error: objects are not equal!")
##D }
## End(Not run)



