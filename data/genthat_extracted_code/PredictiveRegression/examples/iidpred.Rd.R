library(PredictiveRegression)


### Name: iidpred
### Title: IID predictor
### Aliases: iidpred
### Keywords: models regression

### ** Examples

  train <- matrix(c(0,10,20,30, 1.01,10.99,21.01,30.99), nrow=4, ncol=2);
  test <- matrix(c(5,15,25), nrow=3, ncol=1);
  output <- iidpred(train,test,c(0.05,0.2),0.01);
  print(output[[1]]);
  print(output[[2]]);



