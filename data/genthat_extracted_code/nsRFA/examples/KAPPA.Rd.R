library(nsRFA)


### Name: KAPPA
### Title: Four parameter kappa distribution and L-moments
### Aliases: KAPPA f.kappa F.kappa invF.kappa Lmom.kappa par.kappa
###   rand.kappa
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
parameters <- par.kappa(ll[1],ll[2],ll[4],ll[5])
f.kappa(1800,parameters$xi,parameters$alfa,parameters$k,parameters$h)
F.kappa(1800,parameters$xi,parameters$alfa,parameters$k,parameters$h)
invF.kappa(0.771088,parameters$xi,parameters$alfa,parameters$k,parameters$h)
Lmom.kappa(parameters$xi,parameters$alfa,parameters$k,parameters$h)
rand.kappa(100,parameters$xi,parameters$alfa,parameters$k,parameters$h)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.kappa(Rll[1],Rll[2],Rll[4],Rll[5])
Lmom.kappa(parameters$xi,parameters$alfa,parameters$k,parameters$h)



