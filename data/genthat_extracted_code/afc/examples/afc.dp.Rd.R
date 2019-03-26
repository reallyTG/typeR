library(afc)


### Name: afc.dp
### Title: 2AFC For Dichotomous Observations And Probabilistic Forecasts
### Aliases: afc.dp
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of dichotomous observations and probabilistic forecasts
  data(cnrm.nino34.dp)
  obsv = cnrm.nino34.dp$obsv
  fcst = cnrm.nino34.dp$fcst

  #Calculate skill score
  afc.dp(obsv,fcst)




