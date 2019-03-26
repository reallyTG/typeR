library(autopls)


### Name: postprocessing
### Title: Test for model extrapolations or interpolations and removal of
###   bold predictions in autopls
### Aliases: postprocessing liability confine
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)

  ## new data
  new <- murnau.X + 500 

  ## prediction
  pred <- predict (model, new)

  ## check uncertainty
  liability (model, pred)

  ## remove predictions with uncertainty value > 5
  confine (model, pred, 5)



