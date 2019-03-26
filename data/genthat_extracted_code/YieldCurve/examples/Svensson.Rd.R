library(YieldCurve)


### Name: Svensson
### Title: Estimation of the Svensson parameters
### Aliases: Svensson
### Keywords: models htest

### ** Examples

data(ECBYieldCurve)
maturity.ECB <- c(0.25,0.5,seq(1,30,by=1))
A <- Svensson(ECBYieldCurve[1:10,], maturity.ECB )
Svensson.rate <- Srates( A, maturity.ECB, "Spot" )
plot(maturity.ECB, Svensson.rate[5,],main="Fitting Svensson yield curve",
 xlab=c("Pillars in years"), type="l", col=3)
lines( maturity.ECB, ECBYieldCurve[5,],col=2)
legend("topleft",legend=c("fitted yield curve","observed yield curve"),
col=c(3,2),lty=1)
grid()



