library(afc)


### Name: afc.mm
### Title: 2AFC For Ordinal Polychotomous Observations And Ordinal
###   Polychotomous Forecasts
### Aliases: afc.mm
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychotomous observations (4 categories) and polychotomous forecasts (4 categories)
  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst

  #Calculate skill score
  afc.mm(obsv,fcst,4,4)




