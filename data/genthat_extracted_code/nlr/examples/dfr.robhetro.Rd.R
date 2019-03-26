library(nlr)


### Name: dfr.robhetro
### Title: Derivative free (RME)
### Aliases: dfr.robhetro
### Keywords: robust statistics heteroscedastic error MM-estimators Nelder
###   Mead optimization

### ** Examples

ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
rbhfitt <- dfr.robhetro(formula=nlrobj1[[16]],data=datalist,start=ntpstart,
robfunc=nl.robfuncs[["hampel"]],tau=ntpstarttau,varmodel=nlrobjvarmdls3[[2]],robscale=T,
method="NM",control=nlr.control(tolerance=1e-8))
rbhfitt$parameters



