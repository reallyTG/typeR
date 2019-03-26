library(spm)


### Name: gbmokpred
### Title: Generate spatial predictions using the hybrid method of
###   generalized boosted regression modeling and ordinary kriging (gbmok)
### Aliases: gbmokpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D gbmokpred1 <- gbmokpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D   petrel.grid[, c(1,2)], petrel.grid, family = "gaussian", n.cores=6,
##D   nmax = 12, vgm.args = ("Sph"))
##D names(gbmokpred1)
## End(Not run)




