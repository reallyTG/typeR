library(afc)


### Name: afc.mc
### Title: 2AFC For Ordinal Polychotomous Observations And Continuous
###   Forecasts
### Aliases: afc.mc
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychotomous observations (4 categories) and continuous forecasts
  data(cnrm.nino34.mc)
  obsv = cnrm.nino34.mc$obsv
  fcst = cnrm.nino34.mc$fcst

  #Calculate skill score
  afc.mc(obsv,fcst,4)




