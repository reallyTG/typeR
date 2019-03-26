library(pdR)


### Name: HEGY.test
### Title: Seasonal unit root test based on Hylleberg et al. (1990)
### Aliases: HEGY.test
### Keywords: Seasonal unit root test

### ** Examples

data(inf_Q)
y<-inf_Q[,1]
hegy.out<-HEGY.test(wts=y, itsd=c(1,0,c(1:3)),regvar=0, selectlags=list(mode="aic", Pmax=12))

hegy.out$stats #HEGY test statistics
names(hegy.out) # HEGY objects, which can be called by using $, see below.
hegy.out$hegycoefs
hegy.out$regvarcoefs



