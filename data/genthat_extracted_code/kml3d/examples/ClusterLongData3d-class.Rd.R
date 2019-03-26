library(kml3d)


### Name: ClusterLongData3d-class
### Title: ~ Class: ClusterLongData3d ~
### Aliases: ClusterLongData3d-class [,ClusterLongData3d-method
###   [,ClusterLongData3d,ANY,missing-method [<-,ClusterLongData3d-method
###   [<-,ClusterLongData3d,character,missing,missing-method
###   show,ClusterLongData3d-method
### Keywords: classes

### ** Examples

### Building longData
traj <- array(c(1,2,3,1,4, 3,6,1,8,10, 1,2,1,3,2, 4,2,5,6,3, 4,3,4,4,4, 7,6,5,5,4),
            dim=c(3,5,2))

myCld <- clusterLongData3d(
    traj=traj,
    idAll=as.character(c(100,102,103)),
    time=c(1,2,4,8,15),
    varNames=c("P","A"),
    maxNA=3
)

### Show
myCld

### Get
myCld['varNames']

### Set
myCld['criterionActif']<-"Davies.Bouldin"

### Plot
plot(myCld)




