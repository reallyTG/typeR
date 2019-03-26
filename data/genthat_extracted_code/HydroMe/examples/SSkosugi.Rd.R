library(HydroMe)


### Name: SSkosugi
### Title: A Kosugi water retention model
### Aliases: SSkosugi
### Keywords: models manip

### ** Examples

data(isric)
kosugi.ns=nlsLM(y~SSkosugi(x,thr,ths,alp,nscal),data=subset(isric, Sample=="Benin2"),control=nls.lm.control(maxiter=200,options(warn=-1)))
summary(kosugi.ns)



