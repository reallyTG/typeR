library(bamlss)


### Name: continue
### Title: Continue Sampling
### Aliases: continue
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate and run model with MCMC.
##D set.seed(123)
##D d <- GAMart()
##D b <- bamlss(num ~ s(x1) + s(x2) + s(x3) + te(lon,lat), data = d)
##D 
##D ## Continue sampling.
##D a <- continue(b)
##D 
##D ## Plot all samples.
##D plot(samples(a, combine = FALSE))
## End(Not run)



