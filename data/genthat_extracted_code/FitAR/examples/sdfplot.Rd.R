library(FitAR)


### Name: sdfplot
### Title: Autoregressive Spectral Density Estimation
### Aliases: sdfplot
### Keywords: ts

### ** Examples

#Example 1
#Use AIC to select best subset model to fit to lynx data and
#plot spectral density function
pvec<-SelectModel(SeriesA, ARModel="ARp", lag.max=10, Best=1)
ans<-FitAR(SeriesA, pvec)
sdfplot(ans)
#
#Example 2
#Fit ARMA and plot sdf
ans<-arima(SeriesA, c(1,0,1))
sdfplot(ans)
#
#Example 3
#Fit ARz model using AIC to monthly sunspots and plot spectral density
#Warning: this may take 10 minutes or so.
## Not run: 
##D pvec<-SelectModel(sunspots, lag.max=200, ARModel="ARz", Criterion="AIC", Best=1)
##D ans<-FitAR(sunspots, pvec)
##D sdfplot(ans)
## End(Not run)



