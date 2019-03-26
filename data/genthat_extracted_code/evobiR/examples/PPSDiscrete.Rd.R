library(evobiR)


### Name: PPSDiscrete
### Title: Create Simulated Datasets via PPS
### Aliases: PPSDiscrete
### Keywords: PPS

### ** Examples

data(trees)
data(mcmc2)
data(mcmc3)
# 1 tree 100 q-mats 3 states
PPSDiscrete(trees[[1]], MCMC=mcmc3[,2:10], states=c(.5,.2,.3), N=2)
# 10 trees 100 q-mats 3 states
PPSDiscrete(trees, MCMC=mcmc3, states=c(.5,.2,.3), N=10)
# 10 trees 100 q-mats 2 states
PPSDiscrete(trees, MCMC=mcmc2, states=c(.5,.5), N=10)



