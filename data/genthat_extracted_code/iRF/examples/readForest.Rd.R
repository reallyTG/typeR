library(iRF)


### Name: readForest
### Title: Pass data through a fitted forest, record node characteristics
###   [works for binary classification with continuous variables]
### Aliases: readForest

### ** Examples

  n = 50; p = 10
  X = array(rnorm(n*p), c(n, p))
  Y = (X[,1]>0.35 & X[,2]>0.35)|(X[,5]>0.35 & X[,7]>0.35)
  Y = as.factor(as.numeric(Y>0))

  train.id = 1:(n/2)
  test.id = setdiff(1:n, train.id)
  
  rf <- randomForest(x=X, y=Y, keep.forest=TRUE, track.nodes=TRUE,
    ntree=100)
  rforest <- readForest(rfobj=rf, x=X, n.core=2)
  head(rforest$tree_info)

 # count number of leaf nodes with at least 5 observations
  sum(rforest$tree.info$size.node > 5)




