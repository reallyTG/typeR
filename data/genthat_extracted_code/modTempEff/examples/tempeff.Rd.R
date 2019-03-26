library(modTempEff)


### Name: tempeff
### Title: Modelling temperature effects on mortality
### Aliases: tempeff
### Keywords: regression

### ** Examples

## Not run: 
##D library(modTempEff)
##D data(dataDeathTemp)
##D o1<-tempeff(dec1~day+factor(dweek)+factor(year)+factor(month)+
##D       csdl(mtemp,L=c(60,60),psi=20),
##D       data=dataDeathTemp, fcontrol = fit.control(display=TRUE))
##D 
##D #add a ridge penalty: note how you *can* specify ridge!
##D #you do NOT need to use csdl(..,ridge=..) 
##D o2<-update(o1, ridge=list(cold="l^2", heat="l^2"))
##D 
##D #a model without temperature effects (the first drop.L obs are dropped)
##D o3<-tempeff(dec1~day+factor(dweek)+factor(year)+factor(month),
##D       data=dataset,drop.L=60)
##D 
##D #see ?anova.modTempEff for model comparisons
## End(Not run)



