library(spm)


### Name: rgokpred
### Title: Generate spatial predictions using the hybrid method of random
###   forest in ranger and ordinary kriging (RGOK)
### Aliases: rgokpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rgokpred1 <- rgokpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D petrel.grid[, c(1,2)], petrel.grid, num.trees = 500, nmax = 12, vgm.args =
##D ("Sph"))
##D names(rgokpred1)
## End(Not run)




