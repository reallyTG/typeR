library(DescTools)


### Name: Shade
### Title: Produce a Shaded Curve
### Aliases: Shade
### Keywords: aplot

### ** Examples

curve(dt(x, df=5), xlim=c(-6,6),
      main=paste("Student t-Distribution Probability Density Function, df = ", 5, ")", sep=""),
      type="n", las=1, ylab="probability", xlab="t")

Shade(dt(x, df=5), breaks=c(-6, qt(0.025, df=5), qt(0.975, df=5), 6),
      col=c(hred, hblue), density=c(20, 7))



