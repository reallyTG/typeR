library(aucm)


### Name: dcsauc
### Title: AUC optimization with DCA
### Aliases: dcsauc srauc auc.dca smooth.rauc dcsauc.f

### ** Examples

#
#
#dat = sim.dat.1(n=100,seed=1)
#dat.test = sim.dat.1(n=1e3,seed=1000)
#
#t.1 = system.time({
#    fit.1=sauc.dca(y~x1+x2, dat, zeta=.1)
#})
#
#t.2 = system.time({
#    fit.2=sauc.dca(y~x1+x2, dat, zeta=1)
#})
#
## compare time
#rbind(t.1, t.2)[,3]
#
## compare performance
#RUnit::checkEqualsNumeric(
#    c(fit.1$train.auc, fit.2$train.auc)
#, c(0.7291917, 0.7282913), tolerance=1e-6)
#






