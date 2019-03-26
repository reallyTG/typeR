library(OpenMx)


### Name: mxAlgebraFromString
### Title: Create MxAlgebra object from a string
### Aliases: mxAlgebraFromString

### ** Examples

A <- mxMatrix(values = runif(25), nrow = 5, ncol = 5, name = 'A')
B <- mxMatrix(values = runif(25), nrow = 5, ncol = 5, name = 'B')
model <- mxModel(A, B, name = 'model',
  mxAlgebraFromString("A * (B + A)", name = 'test'))
model <- mxRun(model)
model[['test']]$result
A$values * (B$values + A$values)



