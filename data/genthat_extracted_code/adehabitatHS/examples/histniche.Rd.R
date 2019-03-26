library(adehabitatHS)


### Name: histniche
### Title: Histograms of the Ecological Niche
### Aliases: histniche
### Keywords: multivariate

### ** Examples

## Not run: 
##D 
##D data(puechabonsp)
##D cp <- count.points(puechabonsp$relocs, puechabonsp$map)
##D puechabonsp$map
##D 
##D histniche(slot(puechabonsp$map, "data"), slot(cp, "data")[,1])
##D histniche(slot(puechabonsp$map, "data"), slot(cp, "data")[,1],
##D           ty="l")
##D 
## End(Not run)



