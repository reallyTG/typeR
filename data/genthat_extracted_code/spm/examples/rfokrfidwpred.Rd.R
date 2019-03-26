library(spm)


### Name: rfokrfidwpred
### Title: Generate spatial predictions using the average of the hybrid
###   method of random forest and ordinary kriging and the hybrid method of
###   random forest and inverse distance weighting (RFOKRFIDW)
### Aliases: rfokrfidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rfokrfidwpred1 <- rfokrfidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)],
##D petrel[, 3], petrel.grid[, c(1,2)], petrel.grid, ntree = 500, idp = 2,
##D nmaxok = 12, nmaxidw = 12)
##D names(rfokrfidwpred1)
## End(Not run)




