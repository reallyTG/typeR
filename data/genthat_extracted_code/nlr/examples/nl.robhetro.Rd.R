library(nlr)


### Name: nl.robhetro
### Title: Robust Multi Stage Estimate.
### Aliases: nl.robhetro
### Keywords: robust statistics heteroscedastic error MM-estimators

### ** Examples

# ntp data fitt
# tolerance is set as 1e-3 for testing purposes
# is not accurate enough, user can increase it.
ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
datalist[[nlrobjvarmdls3[[2]]$independent]]<-ntp$dm.k
aa1 <- nl.robhetro(formula=nlrobj1[[16]],data=datalist,
start=ntpstart,robfunc=nl.robfuncs[["hampel"]],
tau=ntpstarttau,varmodel=nlrobjvarmdls3[[2]],robscale=T,method="NM",
control=nlr.control(tolerance=1e-4))
aa1$parameters



