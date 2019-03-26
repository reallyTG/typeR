library(afc)


### Name: afc.np
### Title: 2AFC For Nominal Polychotomous Observations Ans Probabilistic
###   Forecasts
### Aliases: afc.np
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychotomous observations (4 categories) and probabilistic forecasts
  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst

  #Calculate skill score
  afc.np(obsv,fcst,4)




