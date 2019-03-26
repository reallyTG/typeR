library(YieldCurve)


### Name: Srates
### Title: Interest rates of the Svensson's model.
### Aliases: Srates
### Keywords: htest

### ** Examples

data(ECBYieldCurve)
rate.ECB = first(ECBYieldCurve,'2 day')
maturity.ECB = c(0.25,0.5,seq(1,30,by=1))
SvenssonParameters <- Svensson(rate.ECB, maturity.ECB)
Svensson.rate <- Srates( SvenssonParameters ,maturity.ECB,"Spot")

plot(maturity.ECB, last(rate.ECB,'1 day'),main="Fitting Svensson yield curve",
  xlab=c("Pillars in years"), ylab=c("Rates"),type="o")
lines(maturity.ECB, last(Svensson.rate,'1 day'), col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
col=c(1,2),lty=1)
grid()



