library(glinternet)


### Name: coef.glinternet
### Title: Return main effect and interaction coefficients.
### Aliases: coef.glinternet
### Keywords: models interactions group-lasso

### ** Examples

Y = rnorm(100)
X = matrix(rnorm(100*10), nrow=100)
numLevels = rep(1, 10)
fit = glinternet(X, Y, numLevels)
coeffs = coef(fit)



