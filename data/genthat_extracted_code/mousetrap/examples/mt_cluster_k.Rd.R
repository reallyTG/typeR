library(mousetrap)


### Name: mt_cluster_k
### Title: Estimate optimal number of clusters.
### Aliases: mt_cluster_k

### ** Examples


## Not run: 
##D # Spatialize trajectories
##D KH2017 <- mt_spatialize(KH2017)
##D 
##D # Find k
##D results <- mt_cluster_k(KH2017, use="sp_trajectories")
##D 
##D # Retrieve results
##D results$kopt
##D results$paths
## End(Not run)




