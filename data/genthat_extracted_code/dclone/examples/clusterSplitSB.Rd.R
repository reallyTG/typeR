library(dclone)


### Name: clusterSplitSB
### Title: Size balancing
### Aliases: clusterSplitSB parLapplySB parLapplySLB
### Keywords: utilities connection

### ** Examples

## Not run: 
##D cl <- makePSOCKcluster(2)
##D ## equal sizes, same as clusterSplit(cl, 1:5)
##D clusterSplitSB(cl, 1:5)
##D ## different sizes
##D clusterSplitSB(cl, 1:5, 5:1)
##D x <- list(1, 2, 3, 4)
##D parLapplySB(cl, x, function(z) z^2, size=1:4)
##D stopCluster(cl)
## End(Not run)



