library(frailtypack)


### Name: plot.frailtyPenal
### Title: Plot Method for a Shared frailty model.
### Aliases: plot.frailtyPenal lines.frailtyPenal
### Keywords: file

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D 
##D ###--- Shared frailty model ---###
##D 
##D modSha <- frailtyPenal(Surv(time,event)~as.factor(dukes)+cluster(id),
##D n.knots=10,kappa=10000,data=readmission,hazard="Splines")
##D 
##D plot(modSha,type="surv",conf=FALSE)
##D 
##D ###--- Cox proportional hazard model ---###
##D 
##D modCox <- frailtyPenal(Surv(time,event)~as.factor(dukes),n.knots=10,
##D kappa=10000,data=readmission,hazard="Splines")
##D 
##D plot(modCox)
##D 
##D #-- no confidence bands
##D plot(modSha,conf.bands=FALSE)
##D plot(modCox,conf.bands=FALSE)
##D 
## End(Not run)





