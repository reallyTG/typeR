library(frailtypack)


### Name: summary.frailtyPenal
### Title: summary of parameter estimates of a shared frailty model
### Aliases: summary.frailtyPenal print.summary.frailtyPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D data(kidney)
##D 
##D ##-- Shared frailty model --##
##D 
##D modSha <- frailtyPenal(Surv(time,status)~age+sex+cluster(id),
##D n.knots=8,kappa=10000,data=kidney,hazard="Splines")
##D 
##D ##-- Cox proportional hazard model --##
##D 
##D modCox <- frailtyPenal(Surv(time,status)~age+sex,
##D n.knots=8,kappa=10000,data=kidney,hazard="Splines")
##D 
##D #-- confidence interval at 95% level (default)
##D 
##D summary(modSha)
##D summary(modCox)
##D 
##D #-- confidence interval at 99% level
##D 
##D summary(modSha,level=0.99)
##D summary(modCox,level=0.99)
##D 
## End(Not run)





