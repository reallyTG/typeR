library(openair)


### Name: trajCluster
### Title: Calculate clusters for back tracectories
### Aliases: trajCluster
### Keywords: methods

### ** Examples

## Not run: 
##D ## import trajectories
##D traj <- importTraj(site = "london", year = 2009)
##D ## calculate clusters
##D clust <- trajCluster(traj, n.clusters = 5)
##D head(clust$data) ## note new variable 'cluster'
##D ## use different distance matrix calculation, and calculate by season
##D traj <- trajCluster(traj, method = "Angle", type = "season", n.clusters = 4)
## End(Not run)



