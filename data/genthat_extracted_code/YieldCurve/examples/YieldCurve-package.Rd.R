library(YieldCurve)


### Name: YieldCurve-package
### Title: Modelling and estimation of the yield curve
### Aliases: YieldCurve-package YieldCurve
### Keywords: models htest

### ** Examples

### Nelson.Siegel function and Fed data-set ###
data(FedYieldCurve)
rate.Fed = first(FedYieldCurve,'5 month')
maturity.Fed <- c(3/12, 0.5, 1,2,3,5,7,10)
NSParameters <- Nelson.Siegel( rate= rate.Fed, maturity=maturity.Fed )
y <- NSrates(NSParameters[5,], maturity.Fed)
plot(maturity.Fed,rate.Fed[5,],main="Fitting Nelson-Siegel yield curve", type="o")
lines(maturity.Fed,y, col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
col=c(1,2),lty=1)

### Svensson function and ECB data-set ###
data(ECBYieldCurve)
rate.ECB = ECBYieldCurve[1:5,]
maturity.ECB = c(0.25,0.5,seq(1,30,by=1))
SvenssonParameters <- Svensson(rate.ECB, maturity.ECB)
Svensson.rate <- Srates( SvenssonParameters ,maturity.ECB,"Spot")

plot(maturity.ECB, rate.ECB[5,],main="Fitting Svensson yield curve", type="o")
lines(maturity.ECB, Svensson.rate[5,], col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
col=c(1,2),lty=1)



