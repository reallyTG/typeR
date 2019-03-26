library(dirichletprocess)


### Name: ClusterLabelPredict
### Title: Predict the cluster labels of some new data.
### Aliases: ClusterLabelPredict

### ** Examples

y <- rnorm(10)
dp <- DirichletProcessGaussian(y)
dp <- Fit(dp, 5)
newY <- rnorm(10, 1)
pred <- ClusterLabelPredict(dp, newY)




