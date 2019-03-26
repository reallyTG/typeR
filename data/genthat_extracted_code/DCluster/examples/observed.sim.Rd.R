library(DCluster)


### Name: observed.sim
### Title: Randomly Generate Observed Cases from Different Statistical
###   Distributions
### Aliases: multinom.sim poisson.sim negbin.sim
### Keywords: distribution

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

#Carry out simulations
datasim<-multinom.sim(sids, mle=calculate.mle(sids, model="multinomal") )

#Estimators for Poisson distribution
datasim<-poisson.sim(sids, mle=calculate.mle(sids, model="poisson") )

#Estimators for Negative Binomial distribution
datasim<-negbin.sim(sids, mle=calculate.mle(sids, model="negbin") )




