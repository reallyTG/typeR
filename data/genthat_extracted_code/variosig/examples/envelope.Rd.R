library(variosig)


### Name: envelope
### Title: Generate Pointwise Variogram Envelope
### Aliases: envelope envelope.gstatVariogram envelope.variogram
### Keywords: models

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D 
##D ## for gstat variogram
##D 
##D library(gstat)
##D data(meuse)
##D coordinates(meuse) = ~x+y
##D vario0 <- gstat::variogram(log(zinc)~1, meuse)
##D varioEnv <- envelope(vario0, data = meuse,
##D   formula = log(zinc)~1, nsim = 499, cluster = TRUE, n.cluster = 10)
##D 
##D ## for geoR variog
##D 
##D library(geoR)
##D data(meuse)
##D meuse <- as.geodata(meuse, coords.col = 1:2, data.col = 6, covar.col = 3:5)
##D meuse$data <- log(meuse$data)
##D vario0 <- variog(meuse,max.dist=1500)
##D varioEnv <- envelope(vario0, data = meuse,
##D   trend = trend.spatial(~lead, meuse), nsim = 499)
## End(Not run)


