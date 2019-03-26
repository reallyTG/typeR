library(georob)


### Name: sample.variogram
### Title: Computing (Robust) Sample Variograms of Spatial Data
### Aliases: sample.variogram sample.variogram.default
###   sample.variogram.formula sample.variogram.georob
###   summary.sample.variogram print.summary.sample.variogram
###   plot.sample.variogram
### Keywords: models spatial robust

### ** Examples

data(wolfcamp, package = "geoR")

## fitting an isotropic IRF(0) model
r.sv.iso <- sample.variogram(wolfcamp[["data"]], locations = wolfcamp[[1]], 
    lag.dist.def = seq(0, 200, by = 15))

## Not run: 
##D plot(r.sv.iso, type = "l")
## End(Not run)

## fitting an anisotropic IRF(0) model
r.sv.aniso <- sample.variogram(wolfcamp[["data"]],
    locations = wolfcamp[[1]], lag.dist.def = seq(0, 200, by = 15),
    xy.angle.def = c(0., 22.5, 67.5, 112.5, 157.5, 180.))
## Not run: 
##D plot(r.sv.aniso, type = "l", add = TRUE, col = 2:5)
## End(Not run)



