library(landest)


### Name: landest-package
### Title: Survival and treatment effect estimation
### Aliases: landest-package landest
### Keywords: package survival

### ** Examples

data(example_rct)
delta.km(tl=example_rct$TL, dl = example_rct$DL, treat = example_rct$treat, tt=2)
#executable but takes time
#delta.land.rct(tl=example_rct$TL, dl = example_rct$DL, treat = example_rct$treat, tt=2, 
#landmark = 1, short = cbind(example_rct$TS,example_rct$DS), z.cov = as.matrix(example_rct$Z))
data(example_obs)
delta.iptw.km(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2,
cov.for.ps = as.matrix(example_obs$Z)) 
#executable but takes time
#delta.land.obs(tl=example_obs$TL, dl = example_obs$DL, treat = example_obs$treat, tt=2, 
#landmark = 1, short = cbind(example_obs$TS,example_obs$DS), z.cov = as.matrix(example_obs$Z),
#cov.for.ps = as.matrix(example_obs$Z))



