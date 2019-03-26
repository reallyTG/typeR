library(evir)


### Name: gpd.sfall
### Title: Add Expected Shortfall Estimates to a GPD Plot
### Aliases: gpd.sfall
### Keywords: iplot

### ** Examples

## Not run: data(danish)
## Not run: out <- gpd(danish, 10)
## Not run: tp <- tailplot(out)
## Not run: gpd.q(tp, 0.999) 
# Estimates 99.9th percentile of Danish fire losses 
## Not run: gpd.sfall(tp, 0.999) 
# Estimates associated expected shortfall for Danish fire losses 



