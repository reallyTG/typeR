library(nsRFA)


### Name: GEV
### Title: Three parameter generalized extreme value distribution and
###   L-moments
### Aliases: GEV f.GEV F.GEV invF.GEV Lmom.GEV par.GEV rand.GEV
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
parameters <- par.GEV(ll[1],ll[2],ll[4])
f.GEV(1800,parameters$xi,parameters$alfa,parameters$k)
F.GEV(1800,parameters$xi,parameters$alfa,parameters$k)
invF.GEV(0.7518357,parameters$xi,parameters$alfa,parameters$k)
Lmom.GEV(parameters$xi,parameters$alfa,parameters$k)
rand.GEV(100,parameters$xi,parameters$alfa,parameters$k)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.GEV(Rll[1],Rll[2],Rll[4])
Lmom.GEV(parameters$xi,parameters$alfa,parameters$k)



