library(HydroMe)


### Name: SSvgm
### Title: A van Genuchten water retention model
### Aliases: SSvgm
### Keywords: models manip

### ** Examples

data(isric)
vn.ns=nlsLM(y~SSvgm(x,thr,ths,alp,nscal,mscal),data=subset(isric, Sample=="Benin2"),control=nls.lm.control(maxiter=200,options(warn=-1)))
summary(vn.ns)



