library(spm)


### Name: rgpred
### Title: Generate spatial predictions using random forest in ranger (RG)
### Aliases: rgpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D set.seed(1234)
##D rgpred1 <- rgpred(petrel[, c(1,2, 6:9)], petrel[, 5], petrel.grid[, c(1,2)],
##D petrel.grid, num.trees = 500)
##D names(rgpred1)
## End(Not run)




