library(BayesGOF)


### Name: DS.prior
### Title: Prior Diagnostics and Estimation
### Aliases: DS.prior DS.prior.nnu DS.prior.pgu DS.prior.bbu plot.DS_GF
###   print.DS_GF Reduce.LP.coef.univ DS.GF.obj LP.smooth maxent.LP.par
###   maxent.obj.convert EXP.score weight.fun.univ
### Keywords: DS Main Functions

### ** Examples

data(rat)
rat.start <- gMLE.bb(rat$y, rat$n)$estimate
rat.ds <- DS.prior(rat, max.m = 4, rat.start, family = "Binomial")
rat.ds
plot(rat.ds, plot.type = "Ufunc")
plot(rat.ds, plot.type = "DSg")
plot(rat.ds, plot.type = "mDev")



