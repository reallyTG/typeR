library(landest)


### Name: ps.wgt.fun
### Title: Calculates propensity score weights
### Aliases: ps.wgt.fun
### Keywords: regression nonlinear

### ** Examples

data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
delta.iptw.km(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
ps.weights = W.weight) 



