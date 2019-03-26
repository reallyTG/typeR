library(ClusterR)


### Name: Optimal_Clusters_Medoids
### Title: Optimal number of Clusters for the partitioning around Medoids
###   functions
### Aliases: Optimal_Clusters_Medoids

### ** Examples


## Not run: 
##D data(soybean)
##D 
##D dat = soybean[, -ncol(soybean)]
##D 
##D opt_md = Optimal_Clusters_Medoids(dat, 10, 'jaccard_coefficient', plot_clusters = FALSE)
## End(Not run)



