library(kohonen)


### Name: classvec2classmat
### Title: Convert a classification vector into a matrix or the other way
###   around.
### Aliases: classvec2classmat classmat2classvec
### Keywords: classif

### ** Examples

classes <- c(rep(1, 5), rep(2, 7), rep(3, 9))
classmat <- classvec2classmat(classes)
classmat
classmat2classvec(classmat)



