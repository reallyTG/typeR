library(nsRFA)


### Name: STATICPLOTS
### Title: Static plots
### Aliases: STATICPLOTS Lmoment.ratio.diagram Lspace.HWvsAD Lspace.limits
### Keywords: hplot

### ** Examples

Lmoment.ratio.diagram()
Lspace.HWvsAD()
Lspace.limits()

data(hydroSIMN)
annualflows[c(1:10),]
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
rlm <- regionalLmoments(x,cod)
Lmoment.ratio.diagram()
points(rlm["lcaR"],rlm["lkurR"],col="red",pch=19)

Lspace.HWvsAD()
points(rlm["lcaR"],rlm["lcvR"],col="red",pch=19)



