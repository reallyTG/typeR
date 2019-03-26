library(variosig)


### Name: envplot
### Title: Plot Empirical Variogram and its Pointwise Envelope
### Aliases: envplot

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D coordinates(meuse) = ~x+y
##D vario0 <- gstat::variogram(log(zinc)~1, meuse)
##D varioEnv <- envelope(vario0, data = meuse, formula = log(zinc)~1, nsim = 499)
##D envplot(varioEnv)
## End(Not run)



