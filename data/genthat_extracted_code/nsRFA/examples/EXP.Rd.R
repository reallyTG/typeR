library(nsRFA)


### Name: EXP
### Title: Two parameter exponential distribution and L-moments
### Aliases: EXP f.exp F.exp invF.exp Lmom.exp par.exp rand.exp
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
parameters <- par.exp(ll[1],ll[2])
f.exp(1800,parameters$xi,parameters$alfa)
F.exp(1800,parameters$xi,parameters$alfa)
invF.exp(0.7870856,parameters$xi,parameters$alfa)
Lmom.exp(parameters$xi,parameters$alfa)
rand.exp(100,parameters$xi,parameters$alfa)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.exp(Rll[1],Rll[2])
Lmom.exp(parameters$xi,parameters$alfa)



