library(PracTools)


### Name: gamEst
### Title: Estimate variance model parameter gamma
### Aliases: gamEst
### Keywords: models

### ** Examples

data(hospital)
x <- hospital$x
y <- hospital$y

X <- cbind(sqrt(x), x)
gamEst(X1 = X, x1 = x, y1 = y, v1 = x)



