library(mcompanion)


### Name: JordanDecompositionDefault-class
### Title: A basic class for Jordan decompositions
### Aliases: JordanDecompositionDefault-class JordanDecomposition-class
###   coerce,JordanDecompositionDefault,matrix-method
###   initialize,JordanDecompositionDefault-method
### Keywords: classes

### ** Examples

showClass("JordanDecompositionDefault")

m <- matrix(c(1,2,4,3), nrow = 2)
new("JordanDecompositionDefault", values = rep(0,2), vectors = m)



