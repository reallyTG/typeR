library(nsRFA)


### Name: GENPAR
### Title: Three parameter generalized Pareto distribution and L-moments
### Aliases: GENPAR f.genpar F.genpar invF.genpar Lmom.genpar par.genpar
###   rand.genpar
### Keywords: distribution

### ** Examples

data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
fac <- factor(annualflows["cod"][,])
split(x,fac)

camp <- split(x,fac)$"45"
ll <- Lmoments(camp)
parameters <- par.genpar(ll[1],ll[2],ll[4])
f.genpar(1800,parameters$xi,parameters$alfa,parameters$k)
F.genpar(1800,parameters$xi,parameters$alfa,parameters$k)
invF.genpar(0.7161775,parameters$xi,parameters$alfa,parameters$k)
Lmom.genpar(parameters$xi,parameters$alfa,parameters$k)
rand.genpar(100,parameters$xi,parameters$alfa,parameters$k)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.genpar(Rll[1],Rll[2],Rll[4])
Lmom.genpar(parameters$xi,parameters$alfa,parameters$k)



