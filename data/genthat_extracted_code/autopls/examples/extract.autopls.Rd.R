library(autopls)


### Name: extract.autopls
### Title: Extract information from a fitted autopls model
### Aliases: extract.autopls coef.autopls coef.slim scores.autopls
###   loadings.autopls fitted.autopls get.lv get.iter residuals.autopls
###   predicted slim

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)
  
  ## get fitted values
  fitted(model)



