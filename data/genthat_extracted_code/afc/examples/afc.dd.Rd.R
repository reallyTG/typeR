library(afc)


### Name: afc.dd
### Title: 2AFC For Dichotomous Observations And Dichotomous Forecasts
### Aliases: afc.dd
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of dichotomous observations and dichotomous forecasts
  data(cnrm.nino34.dd)
  obsv = cnrm.nino34.dd$obsv
  fcst = cnrm.nino34.dd$fcst

  #Calculate skill score
  afc.dd(obsv,fcst)




