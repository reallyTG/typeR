library(nsRFA)


### Name: GENLOGIS
### Title: Three parameter generalized logistic distribution and L-moments
### Aliases: GENLOGIS f.genlogis F.genlogis invF.genlogis Lmom.genlogis
###   par.genlogis rand.genlogis
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
parameters <- par.genlogis(ll[1],ll[2],ll[4])
f.genlogis(1800,parameters$xi,parameters$alfa,parameters$k)
F.genlogis(1800,parameters$xi,parameters$alfa,parameters$k)
invF.genlogis(0.7697433,parameters$xi,parameters$alfa,parameters$k)
Lmom.genlogis(parameters$xi,parameters$alfa,parameters$k)
rand.genlogis(100,parameters$xi,parameters$alfa,parameters$k)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.genlogis(Rll[1],Rll[2],Rll[4])
Lmom.genlogis(parameters$xi,parameters$alfa,parameters$k)



