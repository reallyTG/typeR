library(CDM)


### Name: logLik
### Title: Extract Log-Likelihood
### Aliases: logLik.din logLik.gdina logLik.mcdina logLik.gdm logLik.slca
###   logLik.reglca
### Keywords: methods logLik

### ** Examples

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

# logLik method | DINA model
d1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix, rule="DINA")
summary(d1)
lld1 <- logLik(d1)
  ##   > lld1
  ##   'log Lik.' -2042.378 (df=25)
  ##   > attr(lld1,"df")
  ##   [1] 25
  ##   > attr(lld1,"nobs")
  ##   [1] 400
nobs(lld1)

# AIC and BIC
AIC(lld1)
BIC(lld1)



