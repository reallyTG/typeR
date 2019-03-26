library(kml)


### Name: affectFuzzyIndiv
### Title: ~ Function: affectFuzzyIndiv ~
### Aliases: affectFuzzyIndiv

### ** Examples

#######################
### affectFuzzyIndiv

### Some LongitudinalData
traj <- gald()["traj"]

### 4 clusters centers
center <- traj[runif(4,1,nrow(traj)),]

### Affectation of each individual
affectFuzzyIndiv(traj,center)



