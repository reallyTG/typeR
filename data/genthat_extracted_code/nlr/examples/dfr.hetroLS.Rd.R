library(nlr)


### Name: dfr.hetroLS
### Title: Derivative free CLSME.
### Aliases: dfr.hetroLS
### Keywords: hetroscedastic error Nelder-Mead optimization

### ** Examples

ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
htls<- dfr.hetroLS(formula=nlrobj1[[15]], data=datalist, start= ntpstart,tau=ntpstarttau,
varmodel=nlrobjvarmdls3[[2]],control=nlr.control(tolerance=1e-8))
htls$parameters



