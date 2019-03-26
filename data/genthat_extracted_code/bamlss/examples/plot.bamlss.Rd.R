library(bamlss)


### Name: plot.bamlss
### Title: Plotting BAMLSS
### Aliases: plot.bamlss plot.bamlss.results
### Keywords: aplot

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   num ~ s(x1) + s(x2) + s(x3) + te(lon,lat),
##D   sigma ~ s(x2) + te(lon,lat)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Effect plots
##D plot(b, ask = FALSE)
##D plot(b, model = "mu")
##D plot(b, model = "sigma", term = "te(lon,lat)")
##D 
##D ## Trace plots.
##D plot(b, which = "samples")
##D 
##D ## Residual plots.
##D plot(b, which = 3:4)
## End(Not run)



