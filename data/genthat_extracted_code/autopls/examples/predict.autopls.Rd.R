library(autopls)


### Name: predict.autopls
### Title: Prediction using a fitted autopls model
### Aliases: predict.autopls
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model<-autopls (murnau.Y ~ murnau.X)

  ## new data
  new <- murnau.X + 500 

  ## prediction
  predict (model, new)



