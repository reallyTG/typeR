library(afc)


### Name: rank.ensembles
### Title: Rank Ensembles
### Aliases: rank.ensembles
### Keywords: file

### ** Examples


  #Load a set of ensemble forecasts
  data(cnrm.nino34.ce)
  fcst = cnrm.nino34.ce$fcst

  #Rank ensemble forecasts
  rank.ensembles(fcst)




