library(longitudinalData)


### Name: LongData3d-class
### Title: ~ Class: LongData3d ~
### Aliases: LongData3d LongData3d-class [,LongData3d-method
###   [,LongData3d-ANY,ANY,ANY [,LongData3d-ANY,ANY,ANY-method
###   [<-,LongData3d-method [<-,LongData3d-ANY,ANY,ANY-method
###   LongData3d_show show,LongData3d-method is.na,LongData3d-method
### Keywords: classes classif cluster ts

### ** Examples

#################
### building joint trajectories

dn <- data.frame(id=1:3,v1=c(11,14,16),t1=c(1,5,7),v2=c(12,10,13),t2=c(2,5,0),t3=c(3,6,8))
(ld <- longData3d(dn,timeInData=list(Vir=c(2,4,NA),Tes=c(3,5,6))))

### Scaling
scale(ld)
(ld)

### Plotting
plotTrajMeans3d(ld)
restoreRealData(ld)



