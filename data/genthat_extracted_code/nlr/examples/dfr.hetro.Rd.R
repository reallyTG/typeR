library(nlr)


### Name: dfr.hetro
### Title: Derivative free (CME)
### Aliases: dfr.hetro
### Keywords: hetroscedastic error Nelder-Mead optimization

### ** Examples

ntpstart22=list(p1=.12,p2=7,p3=1,p4=160)
ntpstarttau22=list(tau1=-1.24,tau2=2.56,tau3=.03042)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
datalist[[nlrobjvarmdls3[[2]]$independent]]<-ntp$dm.k
ntpfit<- dfr.robhetro(formula=nlrobj1[[16]],data=datalist,start=ntpstart22,
robfunc=nl.robfuncs[["hampel"]], tau=ntpstarttau22,
varmodel=nlrobjvarmdls3[[2]],robscale=TRUE,method="NM",control=nlr.control(tolerance=1e-4,
maxiter=150))
ntpfit$parameters



