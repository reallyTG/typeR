library(landest)


### Name: surv.iptw.km
### Title: Estimates survival using inverse probability of treatment
###   weighted (IPTW) Kaplan-Meier estimation
### Aliases: surv.iptw.km
### Keywords: survival nonparametric robust

### ** Examples

data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
example_obs.treat = example_obs[example_obs$treat == 1,]
surv.iptw.km(tl=example_obs.treat$TL, dl = example_obs.treat$DL, tt=2, ps.weights = 
W.weight[example_obs$treat == 1]) 



