library(landest)


### Name: delta.iptw.km
### Title: Estimates survival and treatment effect using inverse
###   probability of treatment weighted (IPTW) Kaplan-Meier estimation
### Aliases: delta.iptw.km
### Keywords: survival nonparametric robust

### ** Examples

data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
delta.iptw.km(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
ps.weights = W.weight) 
delta.iptw.km(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2,
cov.for.ps = as.matrix(example_obs$Z)) 



