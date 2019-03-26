library(PredictiveRegression)


### Name: gausspred
### Title: Gauss predictor
### Aliases: gausspred
### Keywords: models regression

### ** Examples

  train <- matrix(c(1,2,3,4, 2.01,2.99,4.01,4.99), nrow=4, ncol=2);
  test <- matrix(c(0,10,20), nrow=3, ncol=1);
  output <- gausspred(train,test,c(0.05,0.2));
  print(output[[1]]);
  print(output[[2]]);



