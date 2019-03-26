library(georob)


### Name: control.georob
### Title: Tuning Parameters for georob
### Aliases: control.georob param.transf fwd.transf dfwd.transf bwd.transf
###   control.rq control.nleqslv control.optim control.nlminb
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D data(meuse)
##D 
##D r.logzn.rob <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1, control = control.georob(cov.bhat = TRUE, 
##D     cov.ehat.p.bhat = TRUE, initial.fixef = "rq"), verbose = 2)
##D   
##D qqnorm(rstandard(r.logzn.rob, level = 0)); abline(0, 1)
##D qqnorm(ranef(r.logzn.rob, standard = TRUE)); abline(0, 1)
## End(Not run)



