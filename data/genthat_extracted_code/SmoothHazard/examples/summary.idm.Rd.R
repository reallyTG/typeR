library(SmoothHazard)


### Name: summary.idm
### Title: Summary of a fitted illness-death model
### Aliases: summary.idm
### Keywords: methods

### ** Examples


## Not run: 
##D library(prodlim)
##D data(Paq1000)
##D fit.splines <-  idm(formula02=Hist(time=t,event=death,entry=e)~certif,
##D 		formula01=Hist(time=list(l,r),event=dementia)~certif,
##D                 formula12=~1,
##D                 method="Splines",
##D 		data=Paq1000)
##D summary(fit.splines) 
## End(Not run)



