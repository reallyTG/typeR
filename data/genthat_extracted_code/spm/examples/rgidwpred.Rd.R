library(spm)


### Name: rgidwpred
### Title: Generate spatial predictions using the hybrid method of random
###   forest in ranger and inverse distance weighting (RGIDW)
### Aliases: rgidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rgidwpred1 <- rgidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)], petrel[, 3],
##D petrel.grid[, c(1,2)], petrel.grid, num.trees = 500, idp = 2, nmax = 12)
##D names(rgidwpred1)
## End(Not run)




