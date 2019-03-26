library(FitAR)


### Name: Caffeine
### Title: Caffeine industrial time series
### Aliases: Caffeine
### Keywords: datasets

### ** Examples

#Example 1
sdfplot(Caffeine)
TimeSeriesPlot(Caffeine)
#
#Example 2
a<-numeric(3)
names(a)<-c("AIC", "BIC", paste(sep="","BIC(q=", paste(sep="",c(0.85),")")))
z<-Caffeine
lag.max <- ceiling(length(z)/4)
a[1]<-SelectModel(z, lag.max=lag.max, ARModel="AR", Best=1, Criterion="AIC")
a[2]<-SelectModel(z, lag.max=lag.max, ARModel="AR", Best=1, Criterion="BIC")
a[3]<-SelectModel(z, lag.max=lag.max, ARModel="AR", Best=1, Criterion="BICq", t=0.85)
a



