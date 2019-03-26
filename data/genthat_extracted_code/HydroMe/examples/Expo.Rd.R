library(HydroMe)


### Name: Expo
### Title: Exponential water retention model
### Aliases: Expo
### Keywords: models manip

### ** Examples

##Attach sample data (isric data) from the package
data(isric)
pf= subset(isric, Sample=="Benin2")
expo.ns=nlsLM(y~Expo(x,thr,ths,alp),data=pf, control=nls.lm.control(maxiter=200),start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3]))
expo.ns



