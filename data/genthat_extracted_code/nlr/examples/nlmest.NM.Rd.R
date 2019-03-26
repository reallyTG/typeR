library(nlr)


### Name: nlmest.NM
### Title: Nonlinear MM-estimate, Nelder-Mead.
### Aliases: nlmest.NM smptry2
### Keywords: Least Square Robust MM-estimate Nelder-Mead optimization

### ** Examples


ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
datalist[[nlrobjvarmdls3[[2]]$independent]]<-ntp$dm.k
fittnml <- nlmest.NM(formula=nlrobj1[[15]], data = list(xr=ntp$dm.k,yr=ntp$cm.k), start=ntpstart,
robscale = TRUE, robfunc = nl.robfuncs[["hampel"]],control=nlr.control(tolerance=1e-8,trace=TRUE))
fittnml$parameters



