library(PracTools)


### Name: gammaFit
### Title: Iteratively estimate variance model parameter gamma
### Aliases: gammaFit
### Keywords: models

### ** Examples

data(hospital)
x <- hospital$x
y <- hospital$y

X <- cbind(sqrt(x), x)
gammaFit(X = X, x = x, y = y, maxiter=100, tol=0.001)



