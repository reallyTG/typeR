library(nsRFA)


### Name: GUMBEL
### Title: Two parameter Gumbel distribution and L-moments
### Aliases: GUMBEL f.gumb F.gumb invF.gumb Lmom.gumb par.gumb rand.gumb
### Keywords: distribution

### ** Examples

data(hydroSIMN)
annualflows[1:10,]
summary(annualflows)
x <- annualflows["dato"][,]
fac <- factor(annualflows["cod"][,])
split(x,fac)

camp <- split(x,fac)$"45"
ll <- Lmoments(camp)
parameters <- par.gumb(ll[1],ll[2])
f.gumb(1800,parameters$xi,parameters$alfa)
F.gumb(1800,parameters$xi,parameters$alfa)
invF.gumb(0.7686843,parameters$xi,parameters$alfa)
Lmom.gumb(parameters$xi,parameters$alfa)
rand.gumb(100,parameters$xi,parameters$alfa)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.gumb(Rll[1],Rll[2])
Lmom.gumb(parameters$xi,parameters$alfa)



