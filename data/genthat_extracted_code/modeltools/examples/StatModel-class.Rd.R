library(modeltools)


### Name: StatModel-class
### Title: Class "StatModel"
### Aliases: StatModel-class fit,StatModel,ModelEnv-method fit
###   dpp,StatModel-method dpp linearModel predict.linearModel
###   fitted.linearModel print.linearModel weights.linearModel
###   model.matrix.linearModel glinearModel predict.glinearModel
###   fitted.glinearModel print.glinearModel model.matrix.glinearModel
###   survReg fitted.survReg logLik.survReg print.survReg weights.survReg
### Keywords: classes

### ** Examples


  ### linear model example
  df <- data.frame(x = runif(10), y = rnorm(10))
  mf <- dpp(linearModel, y ~ x, data = df)
  mylm <- fit(linearModel, mf)

  ### equivalent
  print(mylm)
  lm(y ~ x, data = df)

  ### predictions
  Predict(mylm, newdata =  data.frame(x = runif(10)))




