library(APtools)


### Name: APSurv
### Title: Estimating the Time-dependent AP and AUC for Censored Time to
###   Event Outcome Data.
### Aliases: APSurv

### ** Examples

library(APtools)
data(mayo)
t0.list=seq(from=min(mayo[,1]),to=max(mayo[,1]),length.out=5)[-c(1,5)]
cut.values=seq(min(mayo[,3]),max(mayo[,3]),length.out=10)[-10]
out <- APSurv(stime=mayo[,1],status=mayo[,2],marker=mayo[,3],
	t0.list=t0.list,cut.values=cut.values,method='bootstrap',
	alpha=0.90,B=500,weight=rep(1,nrow(mayo)),Plot=FALSE)
out



