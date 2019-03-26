library(kml)


### Name: ClusterLongData-class
### Title: ~ Class: ClusterLongData ~
### Aliases: ClusterLongData-class
###   [<-,ClusterLongData,character,missing,missing-method
###   [,ClusterLongData-method is.na,ClusterLongData-method
### Keywords: classes chron spatial classif cluster nonparametric ts

### ** Examples

################
### Creation of some trajectories

traj <- matrix(c(1,2,3,1,4, 3,6,1,8,10, 1,2,1,3,2, 4,2,5,6,3, 4,3,4,4,4, 7,6,5,5,4),6)

myCld <- clusterLongData(
    traj=traj,
    idAll=as.character(c(100,102,103,109,115,123)),
    time=c(1,2,4,8,15),
    varNames="P",
    maxNA=3
)

################
### get and set
myCld["idAll"]
myCld["varNames"]
myCld["traj"]

################
### Creation of a Partition
part2 <- partition(clusters=rep(1:2,3),myCld)
part3 <- partition(clusters=rep(1:3,2),myCld)


################
### Adding a clusterization to a clusterizLongData
myCld["add"] <- part2
myCld["add"] <- part3
myCld



