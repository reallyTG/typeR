library(afc)


### Name: afc.dc
### Title: 2AFC For Dichotomous Observations And Continuous Forecasts
### Aliases: afc.dc
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of dichotomous observations and continuous forecasts
  data(cnrm.nino34.dc)
  obsv = cnrm.nino34.dc$obsv
  fcst = cnrm.nino34.dc$fcst

  #Calculate skill score
  afc.dc(obsv,fcst)




