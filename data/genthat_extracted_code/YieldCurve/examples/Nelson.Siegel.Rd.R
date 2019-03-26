library(YieldCurve)


### Name: Nelson.Siegel
### Title: Estimation of the Nelson-Siegel parameters
### Aliases: Nelson.Siegel
### Keywords: models htest

### ** Examples

data(FedYieldCurve)
maturity.Fed <- c(3/12, 0.5, 1,2,3,5,7,10)
NSParameters <- Nelson.Siegel( rate=first(FedYieldCurve,'10 month'),	maturity=maturity.Fed)
y <- NSrates(NSParameters[5,], maturity.Fed)
plot(maturity.Fed,FedYieldCurve[5,],main="Fitting Nelson-Siegel yield curve",
  xlab=c("Pillars in months"), type="o")
lines(maturity.Fed,y, col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
col=c(1,2),lty=1)
grid()



