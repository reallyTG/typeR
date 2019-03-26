library(SmoothHazard)


### Name: print.idm
### Title: Print method for 'idm' objects
### Aliases: print.idm
### Keywords: methods

### ** Examples


## Not run: 
##D data(Paq1000)
##D library(prodlim)
##D fit.splines <-  idm(formula02=Hist(time=t,event=death,entry=t0)~certif,
##D 		formula01=Hist(time=list(l,r),event=dementia)~certif,
##D                 formula12=~1,
##D                 method="Splines",
##D 		data=Paq1000)
##D print(fit.splines)
##D 
## End(Not run)



