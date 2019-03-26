library(EcoGenetics)


### Name: eco.theilsen
### Title: Theil-sen regression for a raster time series, with
###   parallelization available
### Aliases: eco.theilsen

### ** Examples

## Not run: 
##D require("raster")
##D set.seed(6)
##D 
##D temp <- list()
##D for(i in 1:100) {
##D temp[[i]] <- runif(36,-1, 1)
##D temp[[i]] <- matrix(temp[[i]], 6, 6)
##D temp[[i]] <- raster(temp[[i]])
##D }
##D 
##D temp <- brick(temp)
##D 
##D 
##D writeRaster(temp,"temporal.tif", overwrite=T)
##D rm(temp)
##D ndvisim <- brick("temporal.tif")
##D 
##D date <- seq(from = 1990.1, length.out = 100, by = 0.2)
##D 
##D 
##D # Parallel evaluation ----
##D 
##D eco.theilsen(ndvisim, date)
##D 
##D slope <- raster("slope.tif")
##D pvalue <- raster("pvalue.tif")
##D 
##D par(mfrow = c(1, 2))
##D plot(slope, main = "slope")
##D plot(pvalue, main = "p-value")
##D 
##D file.remove(c("slope.tif", "pvalue.tif"))
##D 
##D 
##D # Serial evaluation ----
##D 
##D eco.theilsen(ndvisim, date)
##D 
##D slope <- raster("slope.tif")
##D pvalue <- raster("pvalue.tif")
##D 
##D par(mfrow = c(1, 2))
##D plot(slope, main = "slope")
##D plot(pvalue, main = "p-value")
##D file.remove(c("temporal.tif", "slope.tif", "pvalue.tif"))
## End(Not run)




