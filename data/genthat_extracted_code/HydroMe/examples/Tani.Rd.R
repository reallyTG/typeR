library(HydroMe)


### Name: Tani
### Title: A Tani water retention model
### Aliases: Tani
### Keywords: models manip

### ** Examples

data(isric)
pf=subset(isric, Sample=="Benin2")
tani.ns=nlsLM(y~Tani(x,thr,ths,alp),data=pf, control=nls.lm.control(maxiter=200),start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3]))
coef(tani.ns)




