library(umx)


### Name: loadings.MxModel
### Title: Extract factor loadings from an EFA (factor analysis).
### Aliases: loadings.MxModel

### ** Examples

myVars <- c("mpg", "disp", "hp", "wt", "qsec")
m1 = umxEFA(name = "test", factors = 2, data = mtcars[, myVars])
loadings(m1)



