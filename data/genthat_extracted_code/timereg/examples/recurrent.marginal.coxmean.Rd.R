library(timereg)


### Name: recurrent.marginal.coxmean
### Title: Estimates marginal mean of recurrent events based on two cox
###   models
### Aliases: recurrent.marginal.coxmean
### Keywords: survival

### ** Examples

## No test: 
### do not test because iid slow  and uses data from mets
require(mets)
data(simrecurrent)
dim(simd) 
simd <- subset(simd,id<500)

ar <- cox.aalen(Surv(start,stop,status)~+1+prop(x.V1)+cluster(id),data=simd,
                   resample.iid=1,,max.clust=NULL,max.timepoint.sim=NULL)

ad <- cox.aalen(Surv(start,stop,death)~+1+prop(x.V1)+cluster(id),data=simd,
                   resample.iid=1,,max.clust=NULL,max.timepoint.sim=NULL)
mm <- recurrent.marginal.coxmean(ar,ad)
with(mm,plot(times,mu,type="s"))
with(mm,lines(times,mu+1.96*se.mu,type="s",lty=2))
with(mm,lines(times,mu-1.96*se.mu,type="s",lty=2))
## End(No test)



