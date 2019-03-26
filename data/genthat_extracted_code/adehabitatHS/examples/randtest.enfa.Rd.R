library(adehabitatHS)


### Name: randtest.enfa
### Title: Randomisation Test for the Ecological Niche Factor Analysis
### Aliases: randtest.enfa
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(chamois)
##D locs <- chamois$locs
##D map <- chamois$map
##D 
##D ## prepare the data
##D tab <- slot(map, "data")
##D tab$Vegetation <- NULL
##D pr <- slot(count.points(locs, map), "data")[,1]
##D 
##D en <- enfa(dudi.pca(tab, scannf=FALSE), pr, scannf = FALSE)
##D (tutu <- randtest(en, nrepet = 100))
##D plot(tutu)
##D 
## End(Not run)



