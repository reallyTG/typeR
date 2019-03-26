library(SmoothHazard)


### Name: idm
### Title: Fit an illness-death model
### Aliases: idm
### Keywords: illness-death

### ** Examples

library(lava)
library(prodlim)
set.seed(17)
d <- simulateIDM(100)
# right censored data
fitRC <- idm(formula01=Hist(time=observed.illtime,event=seen.ill)~X1+X2,
             formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2,
             formula12=Hist(time=observed.lifetime,event=seen.exit)~X1+X2,data=d,
             conf.int=FALSE)
fitRC

## Not run: 
##D set.seed(17)
##D d <- simulateIDM(300)
##D fitRC.splines <- idm(formula01=Hist(time=observed.illtime,event=seen.ill)~X1+X2,
##D              formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2,
##D              formula12=Hist(time=observed.lifetime,event=seen.exit)~1,data=d,
##D              conf.int=FALSE,method="splines")
## End(Not run)
# interval censored data
fitIC <- idm(formula01=Hist(time=list(L,R),event=seen.ill)~X1+X2,
             formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2,
             formula12=Hist(time=observed.lifetime,event=seen.exit)~X1+X2,data=d,
             conf.int=FALSE)
fitIC

## Not run: 
##D 
##D     data(Paq1000)
##D 
##D     # Illness-death model with certif on the 3 transitions
##D     # Weibull parametrization and likelihood maximization
##D 
##D     fit.weib <- idm(formula02=Hist(time=t,event=death,entry=e)~certif,
##D                     formula01=Hist(time=list(l,r),event=dementia)~certif,
##D                     data=Paq1000)
##D 
##D     # Illness-death model with certif on transitions 01 and 02
##D     # Splines parametrization and penalized likelihood maximization
##D     fit.splines <-  idm(formula02=Hist(time=t,event=death,entry=e)~certif,
##D                         formula01=Hist(time=list(l,r),event=dementia)~certif,
##D                         formula12=~1,
##D                         method="Splines",
##D                         data=Paq1000)
##D     fit.weib
##D     summary(fit.splines)
## End(Not run)




