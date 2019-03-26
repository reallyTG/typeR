library(evolqg)


### Name: BayesianCalculateMatrix
### Title: Calculate Covariance Matrix from a linear model fitted with lm()
###   using different estimators
### Aliases: BayesianCalculateMatrix
### Keywords: covariancematrix

### ** Examples

data(iris)
iris.lm = lm(as.matrix(iris[,1:4])~iris[,5])
matrices <- BayesianCalculateMatrix(iris.lm, nu = 0.1, samples = 100)




