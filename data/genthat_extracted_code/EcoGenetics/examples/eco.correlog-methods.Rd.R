library(EcoGenetics)


### Name: plot,eco.correlog,ANY-method
### Title: globalplot
### Aliases: plot,eco.correlog,ANY-method plot,eco.correlog-method
###   show,eco.correlog-method
### Keywords: internal

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # single Moran's I correlogram analysis
##D moran.example <- eco.correlog(Z=eco[[P]][,1], eco$XY, smax=10, size=1000)
##D plot(moran.example)
##D 
##D # multiple Moran's I correlogram analysis
##D moran.example2 <- eco.correlog(Z=eco[[P]], eco$XY, smax=10, size=1000)
##D plot(moran.example2, var ="P2")
##D plot(moran.example2, var ="P3")
##D 
##D corm <- eco.cormantel(M = dist(eco[[P]]), size=1000,smax=7, XY = eco$XY,
##D nsim = 99)
##D plot(corm)
##D 
##D variog <- eco.variogram(Z = eco[[P]][, 2],XY =  eco$XY)
##D plot(variog)
## End(Not run)




