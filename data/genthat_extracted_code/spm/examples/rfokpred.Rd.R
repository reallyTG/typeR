library(spm)


### Name: rfokpred
### Title: Generate spatial predictions using the hybrid method of random
###   forest and ordinary kriging (RFOK)
### Aliases: rfokpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rfokpred1 <- rfokpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D petrel.grid[, c(1,2)], petrel.grid, ntree = 500, nmax = 12, vgm.args =
##D ("Sph"))
##D names(rfokpred1)
## End(Not run)




