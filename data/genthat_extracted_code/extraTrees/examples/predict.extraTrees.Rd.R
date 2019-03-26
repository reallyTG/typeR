library(extraTrees)


### Name: predict.extraTrees
### Title: Function for making predictions from trained ExtraTree object.
### Aliases: predict.extraTrees
### Keywords: regression,classification,trees

### ** Examples

  ## Regression with ExtraTrees:
  n <- 1000  ## number of samples
  p <- 5     ## number of dimensions
  x <- matrix(runif(n*p), n, p)
  y <- (x[,1]>0.5) + 0.8*(x[,2]>0.6) + 0.5*(x[,3]>0.4) + 0.1*runif(nrow(x))
  et <- extraTrees(x, y, nodesize=3, mtry=p, numRandomCuts=2)
  yhat <- predict(et, x)



