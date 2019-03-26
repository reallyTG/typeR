library(autopls)


### Name: reset
### Title: Resets the number of latent vectors and the iteration used in
###   autopls objects
### Aliases: reset
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)
  
  ## select another iteration
  newmodel <- set.iter (model,3)
  
  ## set another number of latent vectors
  evennewermodel <- set.lv (newmodel,2)

  ## return to the original values
  firstmodel <- reset (evennewermodel)




