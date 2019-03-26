library(bmrm)


### Name: binaryClassificationLoss
### Title: Loss functions for binary classification
### Aliases: binaryClassificationLoss hingeLoss logisticLoss rocLoss
###   fbetaLoss

### ** Examples

  x <- cbind(intercept=100,data.matrix(iris[1:2]))
  w <- nrbm(hingeLoss(x,iris$Species=="setosa"));predict(w,x)
  w <- nrbm(logisticLoss(x,iris$Species=="setosa"));predict(w,x)
  w <- nrbm(rocLoss(x,iris$Species=="setosa"));predict(w,x)
  w <- nrbm(fbetaLoss(x,iris$Species=="setosa"));predict(w,x)



