library(nlr)


### Name: dfrmest.NLM
### Title: Derivative free MM-estimate
### Aliases: dfrmest.NLM
### Keywords: Robust statistics MM-estimate Optimization
###   Levenberg-Marquardt Newton optimization

### ** Examples

datalist=list(xr=ntp$dm.k,yr=ntp$cm.k)
ntpstart=list(p1=.12,p2=6,p3=1,p4=33)
ntpstarttau=list(tau1=-.66,tau2=2,tau3=.04)
fittnml <- dfrmest.NLM(formula=nlrobj1[[16]], data = datalist, start=ntpstart,
robscale = TRUE, robfunc = nl.robfuncs[["huber"]],control=
nlr.control(tolerance=1e-8,trace=TRUE))
fittnml$parameters
## The function is currently defined as
"dfrmest.NLM"



