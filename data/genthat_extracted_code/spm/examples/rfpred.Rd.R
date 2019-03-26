library(spm)


### Name: rfpred
### Title: Generate spatial predictions using random forest (RF)
### Aliases: rfpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D rfpred1 <- rfpred(petrel[, c(1,2, 6:9)], petrel[, 5], petrel.grid[, c(1,2)],
##D petrel.grid, ntree = 500)
##D names(rfpred1)
## End(Not run)




