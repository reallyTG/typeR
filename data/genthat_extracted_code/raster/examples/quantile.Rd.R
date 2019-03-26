library(raster)


### Name: quantile
### Title: Raster quantiles
### Aliases: quantile quantile,Raster-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=100, nrow=100)
r[] <- rnorm(ncell(r), 0, 50)
quantile(r)
quantile(r, probs = c(0.25, 0.75), type=7,names = FALSE)



