library(HydroMe)


### Name: Ruso
### Title: A Russo water retention model
### Aliases: Ruso
### Keywords: models manip

### ** Examples

##Attach sample data (isric data) from the package
data(isric)
pf=subset(isric, Sample=="Benin2")
ruso.ns=nlsLM(y~Ruso(x,thr,ths,alp,nscal),data=pf, control=nls.lm.control(maxiter=200),start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3], nscal=Dstart(pf)[4]))
coef(ruso.ns)



