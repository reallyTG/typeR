library(FitAR)


### Name: sdfplot.FitAR
### Title: Autoregressive Spectral Density Estimation for "FitAR"
### Aliases: sdfplot.FitAR
### Keywords: ts

### ** Examples

#Use AIC to select best subset model to fit to lynx data and
#plot spectral density function
pvec<-SelectModel(SeriesA, ARModel="ARp", lag.max=10, Best=1)
ans<-FitAR(SeriesA, pvec)
sdfplot(ans)
#
#plot sdf and put your own title
z<-c(SeriesA)
pvec<-SelectModel(z, ARModel="ARp", lag.max=10, Best=1)
ans<-FitAR(z, pvec)
sdfplot(ans)
title(main="Example SDF")



