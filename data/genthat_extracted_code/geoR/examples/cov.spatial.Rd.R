library(geoR)


### Name: cov.spatial
### Title: Computes Value of the Covariance Function
### Aliases: cov.spatial .cor.number .check.cov.model geoRCovModels
### Keywords: spatial models

### ** Examples

#
# Variogram models with the same "practical" range:
#
v.f <- function(x, ...){1-cov.spatial(x, ...)}
#
curve(v.f(x, cov.pars=c(1, .2)), from = 0, to = 1,
      xlab = "distance", ylab = expression(gamma(h)),
      main = "variograms with equivalent \"practical range\"")
curve(v.f(x, cov.pars = c(1, .6), cov.model = "sph"), 0, 1,
      add = TRUE, lty = 2)
curve(v.f(x, cov.pars = c(1, .6/sqrt(3)), cov.model = "gau"),
      0, 1, add = TRUE, lwd = 2)
legend("topleft", c("exponential", "spherical", "gaussian"),
       lty=c(1,2,1), lwd=c(1,1,2))
#
# Matern models with equivalent "practical range"
# and varying smoothness parameter
#
curve(v.f(x, cov.pars = c(1, 0.25), kappa = 0.5),from = 0, to = 1,
      xlab = "distance", ylab = expression(gamma(h)), lty = 2,
      main = "models with equivalent \"practical\" range")
curve(v.f(x, cov.pars = c(1, 0.188), kappa = 1),from = 0, to = 1,
      add = TRUE)      
curve(v.f(x, cov.pars = c(1, 0.14), kappa = 2),from = 0, to = 1,
      add = TRUE, lwd=2, lty=2)      
curve(v.f(x, cov.pars = c(1, 0.117), kappa = 2),from = 0, to = 1,
      add = TRUE, lwd=2)      
legend("bottomright",
       expression(list(kappa == 0.5, phi == 0.250), 
         list(kappa == 1, phi == 0.188), list(kappa == 2, phi == 0.140),
         list(kappa == 3, phi == 0.117)), lty=c(2,1,2,1), lwd=c(1,1,2,2))
# plotting a nested variogram model
curve(v.f(x, cov.pars = rbind(c(.4, .2), c(.6,.3)),
          cov.model = c("sph","exp")), 0, 1, ylab='nested model')



