library(Dforest)


### Name: DF_easy
### Title: Simple pre-defined pipeline for Decision forest
### Aliases: DF_easy

### ** Examples

  # data(demo_simple)
  X = iris[,1:4]
  Y = iris[,5]
  names(Y)=rownames(X)

  random_seq=sample(nrow(X))
  split_rate=3
  split_sample = suppressWarnings(split(random_seq,1:split_rate))
  Train_X = X[-random_seq[split_sample[[1]]],]
  Train_Y = Y[-random_seq[split_sample[[1]]]]
  Test_X = X[random_seq[split_sample[[1]]],]
  Test_Y = Y[random_seq[split_sample[[1]]]]

  Result = DF_easy(Train_X, Train_Y, Test_X, Test_Y)



