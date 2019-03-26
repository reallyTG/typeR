library(Dforest)


### Name: DF_CV
### Title: Decision Forest algorithm: Model training with Cross-validation
### Aliases: DF_CV

### ** Examples

  ##data(iris)
  X = iris[,1:4]
  Y = iris[,5]
  names(Y)=rownames(X)

  random_seq=sample(nrow(X))
  split_rate=3
  split_sample = suppressWarnings(split(random_seq,1:split_rate))
  Train_X = X[-random_seq[split_sample[[1]]],]
  Train_Y = Y[-random_seq[split_sample[[1]]]]

  CV_result = DF_CV(Train_X, Train_Y)





