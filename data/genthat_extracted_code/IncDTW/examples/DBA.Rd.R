library(IncDTW)


### Name: DBA
### Title: Dynamic Time Warping Barycenter Averaging
### Aliases: DBA centroid
### Keywords: classif cluster ts

### ** Examples

## Not run: 
##D data("drink_glass")
##D # initialize with any time series 
##D m1 <- DBA(lot = drink_glass[1:10], m0 = drink_glass[[1]], 
##D           dist_method = "norm2", iterMax = 20)
##D 
##D # initialize with the centroid
##D 
##D tmp <- centroid(drink_glass)
##D cent <- drink_glass[[tmp$centroid_index]]
##D m1 <- DBA(lot = drink_glass[1:10], m0 = cent, 
##D           dist_method = "norm2", iterMax = 20)
##D plot(sapply(m1$iterDist_m2lot, mean), xlab = "Iterations",
##D          ylab = "mean distance", 
##D          main = "Distance of updated bary center to lot")
##D plot(m1$iterDist_m2m, ylab = "distance", xlab = "Iterations", 
##D      main = "Distance of iterations of bary center updates")
##D 
##D plot(m1)
##D plot(m1, type = "m2m")
##D plot(m1, type = "m2lot")
##D 
##D 
## End(Not run)



