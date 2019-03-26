library(afc)


### Name: afc.nn
### Title: 2AFC For Nominal Polychotomous Observations And Nominal
###   Polychotomous Forecasts
### Aliases: afc.nn
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychotomous observations and polychotomous forecasts (4 categories)
  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst

  #Calculate skill score
  afc.nn(obsv,fcst,4)




