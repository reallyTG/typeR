library(surrosurv)


### Name: loocv
### Title: Leave-one-trial-out cross-validation for treatment effect
###   prediction
### Aliases: loocv loocv.surrosurv print.loocvSurrosurv plot.loocvSurrosurv
### Keywords: cross-validation leave-one-out

### ** Examples

  ## No test: 
  # Possibly long computation time!
  data('gastadv')
  cvRes <- loocv(gastadv)
  cvRes
  plot(cvRes)
  
## End(No test)



