library(sdcTarget)


### Name: sdcTargetMatrixClass-class
### Title: S4 Target Matrix
### Aliases: initialize,sdcTargetMatrixClass-method
###   sdcTargetMatrixClass-class

### ** Examples

set.seed(256)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.tdef <- new("sdcTargetDefinitionClass", X = my.X)
new("sdcTargetMatrixClass", Tdef = my.tdef)



