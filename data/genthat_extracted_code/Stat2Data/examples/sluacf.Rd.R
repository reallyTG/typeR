library(Stat2Data)


### Name: sluacf
### Title: Computes autocorrelations (ACF) for a time series
### Aliases: sluacf

### ** Examples

data(SeaIce)
ExtentY=ts(SeaIce$Extent,start=1979)
sluacf(ExtentY)
sluacf(ExtentY, maxlag=8,ndiff=1)

data(Inflation)
CPIts=ts(Inflation$CPI,start=c(2009,1),frequency=12)
CPIacf=sluacf(CPIts,maxlag=36,lags=12)
plot(CPIacf,lwd=2,ci.type="ma",xlim=c(1,36),xaxp=c(0,36,6),main="")




