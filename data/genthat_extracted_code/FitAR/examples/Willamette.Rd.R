library(FitAR)


### Name: Willamette
### Title: Willamette Riverflow Time Series
### Aliases: Willamette
### Keywords: datasets

### ** Examples

#Percival and Walden (1993) fit an AR(27).
#Compare spectral densities with subset AR's.
data(Willamette)
pmax<-27
sdfplot(FitAR(log(Willamette), pmax))
p<-SelectModel(log(Willamette), ARModel="ARz", lag.max=pmax, Best=1)
sdfplot(FitAR(log(Willamette), p))
p<-SelectModel(log(Willamette), ARModel="ARp", lag.max=pmax, Best=1)
sdfplot(FitAR(log(Willamette), p), ARModel="ARp", MLEQ=FALSE)



