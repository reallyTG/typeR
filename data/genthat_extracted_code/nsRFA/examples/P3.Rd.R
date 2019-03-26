library(nsRFA)


### Name: P3
### Title: Three parameters Pearson type III distribution and L-moments
### Aliases: P3 f.gamma F.gamma invF.gamma Lmom.gamma par.gamma rand.gamma
###   mom2par.gamma par2mom.gamma
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
parameters <- par.gamma(ll[1],ll[2],ll[4])
f.gamma(1800,parameters$xi,parameters$beta,parameters$alfa)
F.gamma(1800,parameters$xi,parameters$beta,parameters$alfa)
invF.gamma(0.7511627,parameters$xi,parameters$beta,parameters$alfa)
Lmom.gamma(parameters$xi,parameters$beta,parameters$alfa)
rand.gamma(100,parameters$xi,parameters$beta,parameters$alfa)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.gamma(Rll[1],Rll[2],Rll[4])
Lmom.gamma(parameters$xi,parameters$beta,parameters$alfa)

moments <- par2mom.gamma(parameters$alfa,parameters$beta,parameters$xi); moments
mom2par.gamma(moments$mu,moments$sigma,moments$gamm)



