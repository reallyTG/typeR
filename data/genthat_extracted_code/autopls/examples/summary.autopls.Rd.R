library(autopls)


### Name: summary.autopls
### Title: Summary and print functions for autopls objects
### Aliases: summary.autopls summary.slim print.autopls print.slim
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls(murnau.Y ~ murnau.X)
  
  ## print and plot results
  print (model)



