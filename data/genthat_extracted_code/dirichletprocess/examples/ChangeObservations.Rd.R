library(dirichletprocess)


### Name: ChangeObservations
### Title: Change the observations of fitted Dirichlet Process.
### Aliases: ChangeObservations

### ** Examples


y <- rnorm(10)
dp <- DirichletProcessGaussian(y)
dp <- ChangeObservations(dp, rnorm(10))




