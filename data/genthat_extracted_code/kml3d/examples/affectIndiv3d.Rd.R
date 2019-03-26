library(kml3d)


### Name: affectIndiv3d
### Title: ~ Function: affectIndiv3d ~
### Aliases: affectIndiv3d

### ** Examples

#######################
### affectIndiv

### Some trajectories
traj <- gald3d()["traj"]

### 4 clusters centers
center <- traj[runif(4,1,nrow(traj)),,]

### Affectation of each individual
part <- affectIndiv3d(traj,center)


#################
### K-means simulation (3 steps)
plot(clusterLongData3d(traj),parTraj=parTRAJ(col=part+1))
for (i in 1:3){
    center <- calculTrajMean3d(traj,part)
    part <- affectIndiv3d(traj,center)
    plot(clusterLongData3d(traj),parTraj=parTRAJ(col=part+1))
}



