library(MatrixModels)


### Name: model.Matrix
### Title: Construct Possibly Sparse Design or Model Matrices
### Aliases: model.Matrix
### Keywords: models

### ** Examples

data(CO2, package="datasets")
class(sm <- model.Matrix(~ 0+Type*Treatment, data=CO2, sparse=TRUE))
class(dm <- model.Matrix(~ 0+Type*Treatment, data=CO2, sparse=FALSE))
stopifnot(dim(sm) == c(84,4), dim(sm) == dim(dm), all(sm == dm))



