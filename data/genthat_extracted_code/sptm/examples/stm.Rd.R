library(sptm)


### Name: stm
### Title: Fit a semiparametric transformation model
### Aliases: stm getFixedEf.stm

### ** Examples


n=100
beta= c(log(.5), log(.7), log(1.2)) 
t0=2.9999
init = c(log(0.0373*t0),beta)        
dat = sim.fong(n, family="PH", beta, random.censoring="0", design="CC", auxiliary="weak", seed=1)

est = stm(formula=Surv(X,d) ~ z + s + z:s, dat, strata.formula=~d, family="PH", t0=t0, init=init,
    var.est.type="1", verbose=3)




