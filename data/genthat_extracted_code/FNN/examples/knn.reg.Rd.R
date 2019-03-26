library(FNN)


### Name: knn.reg
### Title: k Nearest Neighbor Regression
### Aliases: knn.reg
### Keywords: regression nonparametric

### ** Examples

  if(require(chemometrics)){
    data(PAC);
    pac.knn<- knn.reg(PAC$X, y=PAC$y, k=3);
    
    plot(PAC$y, pac.knn$pred, xlab="y", ylab=expression(hat(y)))
  } 



