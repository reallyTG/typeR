library(timereg)


### Name: recurrent.marginal.mean
### Title: Estimates marginal mean of recurrent events
### Aliases: recurrent.marginal.mean
### Keywords: survival

### ** Examples

## No test: 
### do not test because iid slow  and to avoid dependence on mets
require(mets)
data(simrecurrent)
simd <- subset(simd,id<500)

ar <- aalen(Surv(start,stop,status)~+1+cluster(id),data=simd,resample.iid=1
                                                     ,max.clust=NULL)
ad <- aalen(Surv(start,stop,death)~+1+cluster(id),data=simd,resample.iid=1,
                                                     ,max.clust=NULL)
mm <- recurrent.marginal.mean(ar,ad)
with(mm,plot(times,mu,type="s"))
with(mm,lines(times,mu+1.96*se.mu,type="s",lty=2))
with(mm,lines(times,mu-1.96*se.mu,type="s",lty=2))
## End(No test)



