library(expandFunctions)


### Name: yyHatPlot
### Title: Plot y and yHat on the same scale w/reference line
### Aliases: yyHatPlot

### ** Examples

set.seed(1)
nObs <- 80
X <- distMat(nObs,2)
A <- cbind(c(1,-1))
Y <- X %*% A + rnorm(nObs) # Response data
lmObj <- lm(Y ~ X)
Yhat <- predict(lmObj) # Estimated response
yyHatPlot(Y,Yhat)



