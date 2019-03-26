library(sdcTarget)


### Name: sdcSubstitutionMatrixClass-class
### Title: S4 Substitution Matrix
### Aliases: initialize,sdcSubstitutionMatrixClass-method
###   sdcSubstitutionMatrixClass-class

### ** Examples

set.seed(256)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.smc <- new("sdcSubstitutionMatrixClass",
              T = new("sdcTargetMatrixClass",
                      Tdef = new("sdcTargetDefinitionClass", X = my.X)))



