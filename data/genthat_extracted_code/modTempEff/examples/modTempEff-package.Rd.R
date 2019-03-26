library(modTempEff)


### Name: modTempEff-package
### Title: Modelling temperature effects on mortality via the constrained
###   segmented distributed lag parameterization
### Aliases: modTempEff-package modTempEff
### Keywords: package models

### ** Examples

## Not run: 
##D data(dataDeathTemp)
##D o1<-tempeff(dec1~day+factor(dweek)+factor(year)+factor(month)+
##D       csdl(mtemp,L=c(60,60),psi=20, ridge=list(cold="l^2",heat="l^2")),
##D       data=dataDeathTemp, fcontrol = fit.control(display=TRUE))
##D 
##D o2<-tempeff(dec1~seas(day,30)+
##D       csdl(mtemp,L=c(60,60),psi=20, ridge=list(cold="l^2",heat="l^2")),
##D       data=dataDeathTemp, fcontrol = fit.control(display=FALSE))
##D 
## End(Not run)



