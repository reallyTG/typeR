library(kml3d)


### Name: clusterLongData3d
### Title: ~ Function: clusterLongData3d (or cld3d) ~
### Aliases: cld3d clusterLongData3d
###   clusterLongData3d,ANY,ANY,ANY,ANY,ANY,ANY
###   clusterLongData3d,ANY,ANY,ANY,ANY,ANY,ANY-method
###   clusterLongData3d,missing,missing,missing,missing,missing,missing
###   clusterLongData3d,missing,missing,missing,missing,missing,missing-method

### ** Examples

###############
### Building an array
tr1n <- array(c(1,2,NA, 1,4,NA, 6,1,8, 10,NA,2, 3,NA,NA,
                4,NA,5,  6,3,4, 3,4,4, 4,NA,NA, 5,5,4),
            dim=c(3,5,2))


###############
### clusterLongData

### With maxNA=3
clusterLongData3d(traj=tr1n,
    idAll=as.character(c(100,102,104)),
    time=c(1,2,4,8,16),
    varNames=c("P","A"),
    maxNA=3
)

### With maxNA=2
### Individual 104 is exclude
clusterLongData3d(traj=tr1n,
    idAll=as.character(c(100,102,104)),
    time=c(1,2,4,8,16),
    varNames=c("P","A"),
    maxNA=2
)




