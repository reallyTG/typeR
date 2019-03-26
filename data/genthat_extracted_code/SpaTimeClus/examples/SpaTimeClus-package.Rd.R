library(SpaTimeClus)


### Name: SpaTimeClus-package
### Title: SpaTimeClus a package for clustering spatio-temporal data
### Aliases: SpaTimeClus SpaTimeClus-package
### Keywords: package

### ** Examples

## Not run: 
##D data(airparif)
##D 
##D # Clustering of the data by considering the spatial dependencies
##D res.spa <- spatimeclus(airparif$obs,  G=3, K=4, Q=4, map = airparif$map,
##D  nbinitSmall=50, nbinitKept=5, nbiterSmall=5)
##D summary(res.spa)
##D 
##D # Clustering of the data without considering the spatial dependencies
##D res.nospa <- spatimeclus(airparif$obs,  G=3, K=4, Q=4, nbinitSmall=50, nbinitKept=5, nbiterSmall=5)
##D summary(res.nospa)
## End(Not run)




