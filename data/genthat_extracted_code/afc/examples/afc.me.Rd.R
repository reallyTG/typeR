library(afc)


### Name: afc.me
### Title: 2AFC For Ordinal Polychotomous Observations And Ensemble
###   Forecasts
### Aliases: afc.me
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychotomous observations (4 categories) and 9-member ensemble forecasts
  data(cnrm.nino34.me)
  obsv = cnrm.nino34.me$obsv
  fcst = cnrm.nino34.me$fcst

  #Calculate skill score
  afc.me(obsv,fcst,4)




