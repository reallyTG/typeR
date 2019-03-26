library(bmrm)


### Name: roc.stat
### Title: Compute statistics for ROC curve plotting
### Aliases: roc.stat

### ** Examples

  x <- cbind(data.matrix(iris[1:4]))
  w <- nrbmL1(rocLoss(x,iris$Species=="versicolor"),LAMBDA=0.01)
  with(roc.stat(x %*% w,iris$Species=="versicolor"),plot(FPR,TPR,type="l"))
  with(roc.stat(-x[,2],iris$Species=="versicolor"),lines(FPR,TPR,col="blue"))



