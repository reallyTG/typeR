library(pomp)


### Name: Particle filter
### Title: Particle filter
### Aliases: 'particle filter' 'sequential Monte Carlo' SMC pfilter
###   pfilter,ANY-method pfilter,missing-method pfilter,pomp-method
###   pfilter-pomp pfilter,pfilterd.pomp-method pfilter-pfilterd.pomp
###   pfilterd.pomp-class pfilterd.pomp logLik,pfilterd.pomp-method
###   logLik-pfilterd.pomp $,pfilterd.pomp-method $-pfilterd.pomp pred.mean
###   pred.mean,pfilterd.pomp-method pred.mean-pfilterd.pomp pred.var
###   pred.var,pfilterd.pomp-method pred.var-pfilterd.pomp filter.mean
###   filter.mean,pfilterd.pomp-method filter.mean-pfilterd.pomp
###   filter.traj filter.traj,pfilterd.pomp-method
###   filter.traj-pfilterd.pomp eff.sample.size
###   eff.sample.size,pfilterd.pomp-method eff.sample.size-pfilterd.pomp
###   cond.logLik cond.logLik,pfilterd.pomp-method
###   cond.logLik-pfilterd.pomp as,pfilterd.pomp-method
###   as.data.frame.pfilterd.pomp coerce,pfilterd.pomp,data.frame-method
### Keywords: ts

### ** Examples

pompExample(gompertz)
pf <- pfilter(gompertz,Np=1000)	## use 1000 particles
plot(pf)
logLik(pf)
cond.logLik(pf)			## conditional log-likelihoods
eff.sample.size(pf)             ## effective sample size
logLik(pfilter(pf))      	## run it again with 1000 particles
## run it again with 2000 particles
pf <- pfilter(pf,Np=2000,filter.mean=TRUE)
fm <- filter.mean(pf)    	## extract the filtering means



