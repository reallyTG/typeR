library(caret)


### Name: spatialSign
### Title: Compute the multivariate spatial sign
### Aliases: spatialSign spatialSign.default spatialSign.matrix
###   spatialSign.data.frame
### Keywords: manip

### ** Examples


spatialSign(rnorm(5))

spatialSign(matrix(rnorm(12), ncol = 3))

# should fail since the fifth column is a factor
try(spatialSign(iris), silent = TRUE)

spatialSign(iris[,-5])

trellis.par.set(caretTheme())
featurePlot(iris[,-5], iris[,5], "pairs")
featurePlot(spatialSign(scale(iris[,-5])), iris[,5], "pairs")




