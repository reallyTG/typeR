library(fractaldim)


### Name: fd.estim.method
### Title: Estimation of Fractal Dimension via Specific Methods
### Aliases: fd.estim.method fd.estim.variation fd.estim.variogram
###   fd.estim.madogram fd.estim.rodogram fd.estim.genton fd.estim.incr1
###   fd.estim.hallwood fd.estim.boxcount fd.estim.periodogram
###   fd.estim.dctII fd.estim.wavelet fd.estim.transect.var
###   fd.estim.transect.incr1 fd.estim.isotropic fd.estim.squareincr
###   fd.estim.filter1
### Keywords: ts spatial

### ** Examples

library(RandomFields)
# 1d time series
n <- 256
rf <- GaussRF(x = c(0,1, 1/n), model = "stable", 
    grid = TRUE, gridtriple = TRUE,
    param = c(mean=0, variance=1, nugget=0, scale=1, kappa=1))
par(mfrow=c(4,2))
fd.estim.variogram (rf, nlags = 20, plot.loglog = TRUE)
fd.estim.variation (rf, nlags = 20, plot.loglog = TRUE)
fd.estim.variogram (rf,  nlags = 3, plot.loglog = TRUE, 
    plot.allpoints = TRUE)
fd.estim.variation (rf, plot.loglog = TRUE, plot.allpoints = TRUE)
fd.estim.hallwood (rf, nlags = 10, plot.loglog = TRUE)
fd.estim.boxcount (rf, nlags = "all", plot.loglog = TRUE, 
    plot.allpoints = TRUE)
fd.estim.periodogram (rf, plot.loglog = TRUE)
fd.estim.dctII (rf, plot.loglog = TRUE)

# 2d random fields
n <- 128
rf2d <- GaussRF(x = c(0,1, 1/n), y = c(0,1, 1/n), model = "stable", 
    grid = TRUE, gridtriple = TRUE,
    param = c(mean=0, variance=1, nugget=0, scale=1, kappa=1))
par(mfrow=c(1,3))
fd.estim.isotropic (rf2d, p.index = 1, direction='hv',
                       plot.loglog = TRUE, plot.allpoints = TRUE)
fd.estim.squareincr (rf2d, p.index = 1, plot.loglog = TRUE, plot.allpoints = TRUE)
fd.estim.filter1 (rf2d, p.index = 1, plot.loglog = TRUE, plot.allpoints = TRUE)



