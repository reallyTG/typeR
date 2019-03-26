library(afc)


### Name: afc.ce
### Title: 2AFC For Continuous Observations And Ensemble Forecasts
### Aliases: afc.ce
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of continuous observations and 9-member ensemble forecasts
  data(cnrm.nino34.ce)
  obsv = cnrm.nino34.ce$obsv
  fcst = cnrm.nino34.ce$fcst

  #Calculate skill score
  afc.ce(obsv,fcst)




