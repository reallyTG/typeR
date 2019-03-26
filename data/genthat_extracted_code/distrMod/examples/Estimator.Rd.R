library(distrMod)


### Name: Estimator
### Title: Function to compute estimates
### Aliases: Estimator
### Keywords: univar

### ** Examples

x <- rnorm(100)
Estimator(x, estimator = mean, name = "mean")

X <- matrix(rnorm(1000), nrow = 10)
Estimator(X, estimator = rowMeans, name = "mean")



