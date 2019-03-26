library(nlr)


### Name: nl.robhetroWM
### Title: Weighted M-estimate.
### Aliases: nl.robhetroWM
### Keywords: robust statistics heteroscedastic error Weighted M-estimators

### ** Examples

ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
datalist[[nlrobjvarmdls3[[2]]$independent]]<-ntp$dm.k
# ntp data fitt
# tolerance is set as 1e-3 for testing purposes
# is not accurate enough, user can increase it.
bb1 <- nl.robhetroWM(formula=nlrobj1[[15]],data=datalist,
start=ntpstart,robfunc=nl.robfuncs[["least square"]],
tau=ntpstarttau,varmodel=nlrobjvarmdls3[[2]],control=nlr.control(tolerance=1e-3,maxiter=1500))
bb1$parameters
#---------------- hampel -----------------
aa1 <- nl.robhetroWM(formula=nlrobj1[[15]],data=datalist,start=ntpstart,
robfunc=nl.robfuncs[["hampel"]],derivfree=T,
tau=ntpstarttau,varmodel=nlrobjvarmdls3[[2]],
control=nlr.control(tolerance=1e-3,maxiter=1500))#,delta=c(0.2,1,1,160,.2,1,.03))
aa1$parameters



