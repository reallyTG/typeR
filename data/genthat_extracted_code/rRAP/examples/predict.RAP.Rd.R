library(rRAP)


### Name: predict.RAP
### Title: Predict method for RAP objects
### Aliases: predict.RAP

### ** Examples

  # 
  library(lars)
  data(diabetes)
  Data = cbind(diabetes$y, diabetes$x)
  # initialize RAP object with a burn in of 50 observations
  R = RAP(X = matrix(diabetes$x[1:50,], nrow=50),
    y = diabetes$y[1:50], r = .995, eps = 0.0005, l0 = .1)
  # make predictions:
  #predict.RAP(object = R, Xnew = diabetes$x[50:70,])




