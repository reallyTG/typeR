library(HydroMe)


### Name: Brook
### Title: Brook-Corey water retention model
### Aliases: Brook
### Keywords: Models manip

### ** Examples

##Attach sample data (isric data) from the package
data(isric)
pf= subset(isric, Sample=="Benin2")
brook.ns=nlsLM(y~Brook(x,thr,ths,alp,nscal),data=pf, control=nls.lm.control(maxiter=200),start=c(thr=Dstart(pf)[1],ths=Dstart(pf)[2], alp=Dstart(pf)[3], nscal=Dstart(pf)[4]-1))
summary(brook.ns)## To produce a summary of modelling results



