library(mclust)


### Name: covw
### Title: Weighted means, covariance and scattering matrices conditioning
###   on a weighted matrix.
### Aliases: covw
### Keywords: multivariate

### ** Examples

# Z as an indicator matrix
X <- iris[,1:4]
Z <- unmap(iris$Species)
str(covw(X, Z))
# Z as a matrix of weights
mod <- Mclust(X, G = 3, modelNames = "VVV")
str(covw(X, mod$z))



