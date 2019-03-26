library(autopls)


### Name: set.lv
### Title: Sets the number of latent vectors in autopls objects
### Aliases: set.lv
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model<-autopls (murnau.Y ~ murnau.X)
  
  ## set another number of latent vectors
  newmodel <- set.lv (model,2)



