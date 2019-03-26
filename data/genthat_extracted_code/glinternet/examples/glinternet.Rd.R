library(glinternet)


### Name: glinternet
### Title: Fit a linear interaction model with group-lasso regularization
###   that enforces strong hierarchy in the estimated coefficients
### Aliases: glinternet
### Keywords: models interactions group-lasso

### ** Examples

# gaussian response, continuous features
Y = rnorm(100)
X = matrix(rnorm(100*10), nrow=100)
numLevels = rep(1, 10)
fit = glinternet(X, Y, numLevels)

#binary response, continuous features
Y = rbinom(100, 1, 0.5)
fit = glinternet(X, Y, numLevels, family="binomial")

#binary response, categorical variables
X = matrix(sample(0:2, 100*10, replace=TRUE), nrow=100)
numLevels = rep(3, 10)
fit = glinternet(X, Y, numLevels, family="binomial")



