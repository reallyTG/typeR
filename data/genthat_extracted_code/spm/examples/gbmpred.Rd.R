library(spm)


### Name: gbmpred
### Title: Generate spatial predictions using generalized boosted
###   regression modeling (gbm)
### Aliases: gbmpred

### ** Examples

## Not run: 
##D data(sponge)
##D data(sponge.grid)
##D gbmpred1 <- gbmpred(sponge[, -c(3)], sponge[, 3], sponge.grid[, c(1:2)],
##D sponge.grid, family = "poisson", n.cores=2)
##D names(gbmpred1)
## End(Not run)




