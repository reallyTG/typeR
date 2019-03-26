library(traj)


### Name: plotCombTraj
### Title: Plot Cluster-Specific Mean or Median Trajectories provided by a
###   'traj' object
### Aliases: plotCombTraj

### ** Examples

# Setup data and time
data = example.data$data
time = example.data$time

# Run step1measures, step2factors and step3clusters with
# a predetermined number of clusters
s1 = step1measures(data,time, ID=TRUE)
s2 = step2factors(s1)
s3.4clusters = step3clusters(s2, nclust = 4)

# Plot mean combination trajectories
plotCombTraj(s3.4clusters)



