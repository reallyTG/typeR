library(landest)


### Name: surv.land.obs
### Title: Estimates survival using landmark estimation
### Aliases: surv.land.obs
### Keywords: survival nonparametric robust

### ** Examples

data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
example_obs.treat = example_obs[example_obs$treat == 1,]
#executable but takes time
#surv.land.obs(tl=example_obs.treat$TL, dl = example_obs.treat$DL, tt=2, landmark = 1, 
#short = cbind(example_obs.treat$TS,example_obs.treat$DS), z.cov = example_obs.treat$Z, 
#ps.weights = W.weight[example_obs$treat == 1])



