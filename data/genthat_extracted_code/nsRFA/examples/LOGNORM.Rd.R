library(nsRFA)


### Name: LOGNORM
### Title: Three parameter lognormal distribution and L-moments
### Aliases: LOGNORM f.lognorm F.lognorm invF.lognorm Lmom.lognorm
###   par.lognorm rand.lognorm
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
parameters <- par.lognorm(ll[1],ll[2],ll[4])
f.lognorm(1800,parameters$xi,parameters$alfa,parameters$k)
F.lognorm(1800,parameters$xi,parameters$alfa,parameters$k)
invF.lognorm(0.7529877,parameters$xi,parameters$alfa,parameters$k)
Lmom.lognorm(parameters$xi,parameters$alfa,parameters$k)
rand.lognorm(100,parameters$xi,parameters$alfa,parameters$k)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.lognorm(Rll[1],Rll[2],Rll[4])
Lmom.lognorm(parameters$xi,parameters$alfa,parameters$k)



