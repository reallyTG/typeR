library(spm)


### Name: rgokrgidwpred
### Title: Generate spatial predictions using the average of the hybrid
###   method of random forest in ranger (RG) and ordinary kriging and the
###   hybrid method of RG and inverse distance weighting (RGOKRGIDW)
### Aliases: rgokrgidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rgokrgidwpred1 <- rgokrgidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)],
##D petrel[, 3], petrel.grid[, c(1,2)], petrel.grid, num.trees = 500, idp = 2,
##D nmaxok = 12, nmaxidw = 12)
##D names(rgokrgidwpred1)
## End(Not run)




