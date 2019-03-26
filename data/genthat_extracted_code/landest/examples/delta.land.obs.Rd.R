library(landest)


### Name: delta.land.obs
### Title: Estimates survival and treatment effect using landmark
###   estimation
### Aliases: delta.land.obs
### Keywords: survival nonparametric robust

### ** Examples

data(example_obs)
W.weight = ps.wgt.fun(treat = example_obs$treat, cov.for.ps = as.matrix(example_obs$Z))	
#executable but takes time
#delta.land.obs(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
#landmark = 1, short = cbind(example_obs$TS,example_obs$DS), z.cov = as.matrix(example_obs$Z),
#ps.weights = W.weight)
#delta.land.obs(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
#landmark = 1, short = cbind(example_obs$TS,example_obs$DS), z.cov = as.matrix(example_obs$Z),
#cov.for.ps = as.matrix(example_obs$Z))




