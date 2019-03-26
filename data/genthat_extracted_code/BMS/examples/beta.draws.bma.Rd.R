library(BMS)


### Name: beta.draws.bma
### Title: Coefficients of the Best Models
### Aliases: beta.draws.bma
### Keywords: utilities

### ** Examples


  #sample a bma object:
  data(datafls)
  mm=bms(datafls,burn=500,iter=5000,nmodel=20)
  
  #coefficients for all
  beta.draws.bma(mm) 
  
  #standard deviations for the fourth- to eight best models
  beta.draws.bma(mm[4:8],TRUE); 




