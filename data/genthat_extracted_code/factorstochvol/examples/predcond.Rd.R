library(factorstochvol)


### Name: predcond
### Title: Predicts means and variances conditionally on the factors
### Aliases: predcond

### ** Examples

## Not run: 
##D set.seed(1)
##D sim <- fsvsim(n = 500, series = 4, factors = 1) # simulate 
##D res <- fsvsample(sim$y, factors = 1) # estimate
##D 
##D # Predict 1 day ahead:
##D predobj <- predcond(res, each = 5)
##D 
##D # Draw from the predictive distribution:
##D preddraws <- matrix(rnorm(length(predobj$mean[,,1]),
##D                     mean = predobj$mean[,,1],
##D                     sd = predobj$vols[,,1]), nrow = 4)
##D 
##D # Visualize the predictive distribution
##D pairs(t(preddraws), col = rgb(0,0,0,.1), pch = 16)
## End(Not run)




