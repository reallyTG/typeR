library(HydroMe)


### Name: SSfredlund
### Title: A Fredlund-Xing water retention model
### Aliases: SSfredlund
### Keywords: models manip

### ** Examples

##Attach sample data (isric data) from the package
data(isric)
pf= subset(isric, Sample=="Benin2")
fredlund.ns=nlsLM(y~SSfredlund(x,thr,ths,alp,nscal,mscal),data=pf,control=nls.lm.control(maxiter=200,options(warn=-1)))
coef(fredlund.ns)



