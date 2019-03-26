library(autopls)


### Name: plot.autopls
### Title: Plotting function for autopls objects
### Aliases: plot.autopls
### Keywords: regression multivariate hplot

### ** Examples

  ## load predictor and response data to the current environment
  data (murnau.X)
  data (murnau.Y)
  data (murnau.W)
  
  ## call autopls with the standard options
  model<-autopls (murnau.Y ~ murnau.X)
  
  ## plot results
  ## Not run: plot (model)

  ## use wavelengths in rc plot
  ## Not run: plot (model, type = "rc", wl = murnau.W, rcxlab = "Wavelength (nm)")
  
  ## predicted vs. observed
  ## Not run: x <- plot (model, type = "ovp")
  ## Not run: x
  



