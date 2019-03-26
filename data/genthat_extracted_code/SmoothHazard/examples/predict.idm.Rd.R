library(SmoothHazard)


### Name: predict.idm
### Title: Predictions for an illness-death model using either a penalized
###   likelihood approach or a Weibull parametrization.
### Aliases: predict.idm
### Keywords: methods

### ** Examples


## Not run: 
##D set.seed(100)
##D d=simulateIDM(n = 100)
##D fit <- idm(formula01=Hist(time=list(L,R),event=seen.ill)~X1+X2+X3,
##D                formula02=Hist(time=observed.lifetime,event=seen.exit)~X1+X2+X3,
##D                data=d,conf.int=FALSE)
##D predict(fit,s=0,t=80,conf.int=FALSE,lifeExpect=FALSE)
##D predict(fit,s=0,t=80,nsim=4,conf.int=TRUE,lifeExpect=FALSE)
##D predict(fit,s=0,t=80,nsim=4,conf.int=FALSE,lifeExpect=TRUE)
##D 
##D data(Paq1000)
##D library(prodlim)
##D fit.paq <- idm(formula02=Hist(time=t,event=death,entry=e)~certif,
##D formula01=Hist(time=list(l,r),event=dementia)~certif,data=Paq1000)
##D 
##D predict(fit.paq,s=70,t=80,newdata=data.frame(certif=1))
##D predict(fit.paq,s=70,lifeExpect=TRUE,newdata=data.frame(certif=1))
##D 
##D fit.splines <-  idm(formula02=Hist(time=t,event=death,entry=e)~certif,
##D 		formula01=Hist(time=list(l,r),event=dementia)~certif,
##D                 formula12=~1,
##D                 method="Splines",
##D 		data=Paq1000)
##D 
##D predict(fit.splines,s=70,t=80,newdata=data.frame(certif=1))
##D predict(fit.splines,s=70,t=80,lifeExpect=TRUE,newdata=data.frame(certif=1),nsim=20)
##D 
##D 
## End(Not run)




