library(bmrm)


### Name: linearRegressionLoss
### Title: Loss functions to perform a regression
### Aliases: linearRegressionLoss lmsRegressionLoss ladRegressionLoss
###   quantileRegressionLoss epsilonInsensitiveRegressionLoss

### ** Examples

  x <- cbind(intercept=100,data.matrix(iris[1:2]))
  y <- iris[[3]]
  w <- nrbm(lmsRegressionLoss(x,y))
  w <- nrbm(ladRegressionLoss(x,y))
  w <- nrbm(quantileRegressionLoss(x,y,q=0.5))
  w <- nrbm(epsilonInsensitiveRegressionLoss(x,y,epsilon=1))



