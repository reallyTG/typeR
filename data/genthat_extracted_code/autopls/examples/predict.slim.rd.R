library(autopls)


### Name: predict.slim
### Title: Prediction using a condensed autopls model
### Aliases: predict.slim
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)

  ## condensed model object
  new.model <- slim (model)
  
  ## new data
  new <- murnau.X + 500 

  ## prediction
  predict (new.model, new)



