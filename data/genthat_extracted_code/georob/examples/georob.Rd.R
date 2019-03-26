library(georob)


### Name: georob
### Title: Robust Fitting of Spatial Linear Models
### Aliases: georob
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D ################
##D ## meuse data ##
##D ################
##D data(meuse)
##D 
##D ## Gaussian REML fit
##D r.logzn.reml <- georob(log(zinc) ~ sqrt(dist), data = meuse, locations = ~ x + y,
##D     variogram.model = "RMexp",
##D     param = c(variance = 0.15, nugget = 0.05, scale = 200),
##D     tuning.psi = 1000)
##D summary(r.logzn.reml, correlation = TRUE)
##D 
##D ## robust REML fit 
##D r.logzn.rob <- update(r.logzn.reml, tuning.psi = 1)
##D     
##D summary(r.logzn.rob, correlation = TRUE)
##D 
##D plot(r.logzn.reml, lag.dist.def = seq(0, 2000, by = 100))
##D lines(r.logzn.rob, col = "red")
##D 
##D 
##D ###################
##D ## wolfcamp data ##
##D ###################
##D data(wolfcamp, package = "geoR")
##D d.wolfcamp <- data.frame(x = wolfcamp[[1]][,1], y = wolfcamp[[1]][,2],
##D     pressure = wolfcamp[[2]])
##D 
##D ## fitting isotropic IRF(0) model
##D   
##D r.irf0.iso <- georob(pressure ~ 1, data = d.wolfcamp, locations = ~ x + y, 
##D     variogram.model = "RMfbm",
##D     param = c(variance = 10, nugget = 1500, scale = 1, alpha = 1.5),
##D     fit.param = default.fit.param(scale = FALSE, alpha = TRUE),
##D     tuning.psi = 1000)
##D   
##D summary(r.irf0.iso)
##D 
##D ## fitting anisotropic IRF(0) model
##D   
##D r.irf0.aniso <- georob(pressure ~ 1, data = d.wolfcamp, locations = ~ x + y, 
##D     variogram.model = "RMfbm",
##D     param = c(variance = 5.9, nugget = 1450, scale = 1, alpha = 1),
##D     fit.param = default.fit.param(scale = FALSE, alpha = TRUE),
##D     aniso = default.aniso(f1 = 0.51, omega = 148.),
##D     fit.aniso = default.fit.aniso(f1 = TRUE, omega = TRUE), 
##D     tuning.psi = 1000)
##D summary(r.irf0.aniso)
##D 
##D plot(r.irf0.iso, lag.dist.def = seq(0, 200, by = 7.5))
##D plot(r.irf0.aniso, lag.dist.def = seq(0, 200, by = 7.5), 
##D     xy.angle.def = c(0, 22.5, 67.5, 112.5, 157.5, 180.), 
##D     add = TRUE, col = 2:5)
##D     
##D pchisq(2*(r.irf0.aniso[["loglik"]] - r.irf0.iso[["loglik"]]), 2, lower = FALSE)
## End(Not run)



