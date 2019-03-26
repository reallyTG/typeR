library(georob)


### Name: profilelogLik
### Title: Profile Likelihood
### Aliases: profilelogLik
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D 
##D data(meuse)
##D 
##D r.logzn.ml <- georob(log(zinc)~sqrt(dist), data=meuse, locations=~x+y,
##D     variogram.model="RMexp", param=c(variance=0.15, nugget=0.05, scale=200),
##D     tuning.psi=1000, control=control.georob(ml.method="ML"))
##D   
##D r.prflik <- profilelogLik(r.logzn.ml, values=expand.grid(scale=seq(75, 600, by=25)))
##D plot(loglik~scale, r.prflik, type="l")
##D abline(v=r.logzn.ml$variogram.object[[1]]$param["scale"], lty="dotted")
##D abline(h=r.logzn.ml$loglik-0.5*qchisq(0.95, 1), lty="dotted")
##D   
## End(Not run)



