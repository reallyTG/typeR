library(spm)


### Name: gbmidwpred
### Title: Generate spatial predictions using the hybrid method of
###   generalized boosted regression modeling and inverse distance
###   weighting (gbmidw)
### Aliases: gbmidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D gbmidwpred1 <- gbmidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D   petrel.grid[, c(1,2)], petrel.grid, family = "gaussian", n.cores=6,
##D   nmax = 12)
##D names(gbmidwpred1)
## End(Not run)




