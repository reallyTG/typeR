library(kml)


### Name: affectIndiv
### Title: ~ Functions: affectIndiv & affectIndivC ~
### Aliases: affectIndiv affectIndivC

### ** Examples

#######################
### affectIndiv

### Some trajectories
traj <- gald()["traj"]

### 4 clusters centers
center <- traj[runif(4,1,nrow(traj)),]

### Affectation of each individual
system.time(part <- affectIndiv(traj,center))
system.time(part <- affectIndivC(traj,center))



