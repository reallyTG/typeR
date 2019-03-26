library(futile.matrix)


### Name: RandomMatrixModel
### Title: Type constructors for random matrices and ensembles of random
###   matrices
### Aliases: Ensemble JacobiMatrix JacobiModel RandomMatrixModel
###   WignerMatrix WignerModel WishartMatrix WishartModel

### ** Examples

model <- WignerModel(10)
m <- rmatrix(model)
e <- Ensemble(20, model)



