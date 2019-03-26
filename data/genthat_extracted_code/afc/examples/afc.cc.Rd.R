library(afc)


### Name: afc.cc
### Title: 2AFC For Continuous Observations And Continuous Forecasts
### Aliases: afc.cc
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of continuous observations and continuous forecasts
  data(cnrm.nino34.cc)
  obsv = cnrm.nino34.cc$obsv
  fcst = cnrm.nino34.cc$fcst

  #Calculate skill score
  afc.cc(obsv,fcst)




