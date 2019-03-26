library(kml3d)


### Name: calculTrajMean3d
### Title: ~ Function: calculTrajMean3d ~
### Aliases: calculTrajMean3d

### ** Examples


#######################
### calculTrajMean3d

### Some LongitudinalData3d
traj <- gald3d()["traj"]

### A partition
part <- floor(runif(150,1,5))
plot(clusterLongData3d(traj),parTraj=parTRAJ(col=part+1))

### Clusters center
(center <- calculTrajMean3d(traj,part))


#################
### K-means simulation (4 steps)
plot(clusterLongData3d(traj),parTraj=parTRAJ(col=part+1))
for (i in 1:4){
    part <- affectIndiv3d(traj,center)
    center <- calculTrajMean3d(traj,part)
    plot(clusterLongData3d(traj),parTraj=parTRAJ(col=part+1))
}




