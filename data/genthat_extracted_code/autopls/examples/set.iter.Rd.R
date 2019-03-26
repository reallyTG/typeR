library(autopls)


### Name: set.iter
### Title: Sets the run of an autopls backwards selection to be used
### Aliases: set.iter
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)
  
  ## set another number of latent vectors
  newmodel <- set.iter (model,3)



