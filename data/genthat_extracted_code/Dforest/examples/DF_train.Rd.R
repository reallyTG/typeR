library(Dforest)


### Name: DF_train
### Title: Decision Forest algorithm: Model training
### Aliases: DF_train

### ** Examples

  ##data(iris)
  X = iris[,1:4]
  Y = iris[,5]
  names(Y)=rownames(X)
  used_model = DF_train(X,factor(Y))




