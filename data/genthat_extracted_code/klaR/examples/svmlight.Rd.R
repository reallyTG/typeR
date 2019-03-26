library(klaR)


### Name: svmlight
### Title: Interface to SVMlight
### Aliases: svmlight svmlight.default svmlight.formula svmlight.matrix
###   svmlight.data.frame svmlight.file
### Keywords: classif

### ** Examples

## Not run: 
##D ## Only works if the svmlight binaries are in the path.
##D data(iris)
##D x <- svmlight(Species ~ ., data = iris)
##D ## Using RBF-Kernel with gamma=0.1:
##D data(B3)
##D x <- svmlight(PHASEN ~ ., data = B3, svm.options = "-t 2 -g 0.1")
## End(Not run)



