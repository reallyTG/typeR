library(DAAG)


### Name: wages1833
### Title: Wages of Lancashire Cotton Factory Workers in 1833
### Aliases: wages1833
### Keywords: datasets

### ** Examples

attach(wages1833)
plot(mwage~age,ylim=range(c(mwage,fwage[fwage>0])))
points(fwage[fwage>0]~age[fwage>0],pch=15,col="red")
lines(lowess(age,mwage))
lines(lowess(age[fwage>0],fwage[fwage>0]),col="red")



