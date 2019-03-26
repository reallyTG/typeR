library(rioja)


### Name: interp.dataset
### Title: Interpolate a dataset
### Aliases: interp.dataset
### Keywords: hplot

### ** Examples

data(RLGH)
spec <- RLGH$spec
depth <- RLGH$depths$Depth

# interpolate new dataset to every 0.5 cm
# using default method (linear)
x.new <- seq(0, 20, by=0.5)
sp.interp <- interp.dataset(y=spec, x=depth, xout=x.new)
## Not run: 
##D # examine the results and compare to original data 
##D strat.plot.simple(spec, depth, sp.interp, x.new)
## End(Not run)



