library(autopls)


### Name: autoplsVAL
### Title: Validate a fitted autopls model
### Aliases: autoplsVAL R2.autopls RMSEP.autopls jack.test.autopls metaval
###   repeatedCV clusterCV
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data(murnau.X)
  data(murnau.Y)
  
  ## call autopls with the standard options
  model<-autopls (murnau.Y ~ murnau.X)
  
  ## Validation
  R2 (model)
  R2 (model, nc = 'all')  
  RMSEP (model)  
  metaval (model, 'R2', 'CV', ic = FALSE)
  
  ## Jackknife test
  jack.test.autopls (model)
  
  ## Meta cross-validation
  repeatedCV (model)



