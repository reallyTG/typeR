library(kml)


### Name: calculTrajMean
### Title: ~ Functions: calculTrajMean & calculTrajMeanC ~
### Aliases: calculTrajMean calculTrajMeanC

### ** Examples

#######################
### calculMean

### Some trajectories
traj <- gald()["traj"]

### A cluster affectation
clust <- initializePartition(3,200,"randomAll")

### Computation of the cluster's centers
system.time(centers <- calculTrajMean(traj,clust))
system.time(centers <- calculTrajMeanC(traj,clust))



