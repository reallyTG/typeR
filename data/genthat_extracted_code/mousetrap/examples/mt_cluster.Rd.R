library(mousetrap)


### Name: mt_cluster
### Title: Cluster trajectories.
### Aliases: mt_cluster

### ** Examples

# Spatialize trajectories
KH2017 <- mt_spatialize(KH2017)

# Cluster trajectories
KH2017 <- mt_cluster(KH2017, use="sp_trajectories")

# Plot clustered trajectories
mt_plot(KH2017,use="sp_trajectories",
  use2="clustering",facet_col="cluster")




