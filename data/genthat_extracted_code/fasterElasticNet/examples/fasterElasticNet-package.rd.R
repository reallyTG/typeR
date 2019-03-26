library(fasterElasticNet)


### Name: fasterElasticNet-package
### Title: Fitting ElasticNet in a fast way.
### Aliases: fasterElasticNet-package fasterElasticNet
### Keywords: package

### ** Examples

  #Use R built-in datasets mtcars for a model fitting
  x <- mtcars[,-1]
  y <- mtcars[, 1]

  #fit model
  model <- ElasticNetCV(x,y)

  #fit a elastic net with lambda2 = 1
  model$Elasticnet_(lambda2 = 1)

  #choose model using cv
  model$cv.choosemodel(k = 31)    #Leave-one-out cross validation
  model$output()				  #See the output

  #predict
  pre <- mtcars[1:3,-1]
  model$predict(pre)



