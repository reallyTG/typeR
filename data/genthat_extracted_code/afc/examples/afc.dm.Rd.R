library(afc)


### Name: afc.dm
### Title: 2AFC For Dichotomous Observations And Ordinal Polychotomous
###   Forecasts
### Aliases: afc.dm
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of dichotomous observations and polychotomous forecasts (4 categories)
  data(cnrm.nino34.dm)
  obsv = cnrm.nino34.dm$obsv
  fcst = cnrm.nino34.dm$fcst

  #Calculate skill score
  afc.dm(obsv,fcst,4)




