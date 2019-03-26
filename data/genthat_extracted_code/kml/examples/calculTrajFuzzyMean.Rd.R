library(kml)


### Name: calculTrajFuzzyMean
### Title: ~ Function: calculTrajFuzzyMean ~
### Aliases: calculTrajFuzzyMean

### ** Examples

#######################
### calculTrajFuzzyMean

### Some LongitudinalData
traj <- gald()["traj"]

### 4 clusters centers
center <- traj[runif(4,1,nrow(traj)),]

### Affectation of each individual
membership <- affectFuzzyIndiv(traj,center)

### Computation of the mean's trajectories
calculTrajFuzzyMean(traj,membership)



