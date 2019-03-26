library(afc)


### Name: afc.de
### Title: 2AFC For Dichotomous Observations and Ensemble Forecasts
### Aliases: afc.de
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of dichotomous observations and 9-member ensemble forecasts
  data(cnrm.nino34.de)
  obsv = cnrm.nino34.de$obsv
  fcst = cnrm.nino34.de$fcst

 #Calculate skill score
  afc.de(obsv,fcst)




