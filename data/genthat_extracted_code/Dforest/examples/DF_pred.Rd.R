library(Dforest)


### Name: DF_pred
### Title: Decision Forest algorithm: Model prediction
### Aliases: DF_pred

### ** Examples

  # data(demo_simple)
  X = data_dili$X
  Y = data_dili$Y
  names(Y)=rownames(X)

  random_seq=sample(nrow(X))
  split_rate=3
  split_sample = suppressWarnings(split(random_seq,1:split_rate))
  Train_X = X[-random_seq[split_sample[[1]]],]
  Train_Y = Y[-random_seq[split_sample[[1]]]]
  Test_X = X[random_seq[split_sample[[1]]],]
  Test_Y = Y[random_seq[split_sample[[1]]]]

  used_model = DF_train(Train_X, Train_Y)
  Pred_result = DF_pred(used_model,Test_X,Test_Y)






