library(variosig)


### Name: envsig
### Title: Determine Significance of Spatial Dependence Using Pointwise
###   Variogram Envelope
### Aliases: envsig

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D coordinates(meuse) = ~x+y
##D vario0 <- gstat::variogram(log(zinc)~1, meuse)
##D varioEnv <- envelope(vario0, data = meuse, formula = log(zinc)~1,
##D   nsim = 500, cluster = TRUE, n.cluster = 10)
##D envplot(varioEnv)
##D envsig(varioEnv, index = 2, method = "eb")
## End(Not run)



