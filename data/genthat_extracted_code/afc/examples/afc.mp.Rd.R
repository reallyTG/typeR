library(afc)


### Name: afc.mp
### Title: 2AFC For Ordinal Polychotomous Observations And Probabilistic
###   Forecasts
### Aliases: afc.mp
### Keywords: file

### ** Examples


  #Forecasts and observations of Nino-3.4 index
  #Load set of polychtomous observations (4 categories) and probabilistic forecasts
  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst

  #Calculate skill score
  afc.mp(obsv,fcst,4)




