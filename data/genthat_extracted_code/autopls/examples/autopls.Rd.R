library(autopls)


### Name: autopls
### Title: autopls
### Aliases: autopls
### Keywords: regression multivariate

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  
  ## call autopls with the standard options
  model <- autopls (murnau.Y ~ murnau.X)
  
  ## S3 plot method
  ## Not run: plot (model)
  ## Not run: plot (model, type = "rc")
  
  ## Loading and score plots
  ## Not run: plot (model$loadings, main = "Loadings")
  ## Not run: plot (model$loadings [,c(1,3)], main = "Loadings")
  ## Not run: plot (model$scores, main = "Scores")
  



