library(snowFT)


### Name: snowFT-startstop
### Title: Starting snowFT Cluster
### Aliases: makeClusterFT makeSOCKclusterFT stopClusterFT
### Keywords: programming

### ** Examples

## Not run: 
##D cl <- makeClusterFT(5, ft_verbose = TRUE)
##D res <- clusterApplyFT(cl, 1:10, get("+"), y = 3)
##D stopClusterFT(res[[2]])
##D print(unlist(res[[1]]))
##D   
## End(Not run)



