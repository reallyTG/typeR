library(georob)


### Name: fit.variogram.model
### Title: Fitting Model Functions to Sample Variograms
### Aliases: fit.variogram.model print.fitted.variogram
###   summary.fitted.variogram print.summary.fitted.variogram
###   lines.fitted.variogram
### Keywords: models spatial robust

### ** Examples

data(wolfcamp, package = "geoR")

## fitting an isotropic IRF(0) model
r.sv.iso <- sample.variogram(wolfcamp[["data"]], locations = wolfcamp[[1]], 
    lag.dist.def = seq(0, 200, by = 15))

## Not run: 
##D r.irf0.iso <- fit.variogram.model(r.sv.iso, variogram.model = "RMfbm",
##D     param = c(variance = 100, nugget = 1000, scale = 1., alpha = 1.),
##D     fit.param = default.fit.param(scale = FALSE, alpha = TRUE),
##D     method = "Nelder-Mead", hessian = FALSE, control = list(maxit = 5000))  
##D summary(r.irf0.iso, correlation = TRUE)
##D 
##D plot(r.sv.iso, type = "l")
##D lines(r.irf0.iso, line.col = "red")
## End(Not run)

## fitting an anisotropic IRF(0) model
r.sv.aniso <- sample.variogram(wolfcamp[["data"]],
    locations = wolfcamp[[1]], lag.dist.def = seq(0, 200, by = 15),
    xy.angle.def = c(0., 22.5, 67.5, 112.5, 157.5, 180.))
  
## Not run: 
##D r.irf0.aniso <- fit.variogram.model(r.sv.aniso, variogram.model = "RMfbm",
##D     param = c(variance = 100, nugget = 1000, scale = 1., alpha = 1.5),
##D     fit.param = default.fit.param(scale = FALSE, alpha = TRUE),
##D     aniso = default.aniso(f1 = 0.4, omega = 135.),
##D     fit.aniso = default.fit.aniso(f1 = TRUE, omega = TRUE),
##D     method = "BFGS", hessian = TRUE, control = list(maxit = 5000))
##D summary(r.irf0.aniso, correlation = TRUE)
##D 
##D plot(r.sv.aniso, type = "l")
##D lines(r.irf0.aniso, xy.angle = seq(0, 135, by = 45))
## End(Not run)



