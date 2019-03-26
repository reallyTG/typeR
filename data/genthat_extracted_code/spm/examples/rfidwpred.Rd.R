library(spm)


### Name: rfidwpred
### Title: Generate spatial predictions using the hybrid method of random
###   forest and inverse distance weighting (RFIDW)
### Aliases: rfidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rfidwpred1 <- rfidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D petrel.grid[, c(1,2)], petrel.grid, ntree = 500, idp = 2, nmax = 12)
##D names(rfidwpred1)
## End(Not run)




