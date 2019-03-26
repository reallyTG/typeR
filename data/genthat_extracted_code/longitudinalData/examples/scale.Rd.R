library(longitudinalData)


### Name: scale
### Title: ~ Function: scale for LongData ~
### Aliases: scale scale,LongData scale,LongData3d scale,LongData-method
###   scale,LongData3d-method
### Keywords: method

### ** Examples

##################
### Building LongData

time=c(1,2,3,4,8,12,16,20)
id2=1:12
f <- function(id,t)((id-1)%%3-1) * t
g <- function(id,t)(id%%2+1)*t
ld1 <- longData3d(array(cbind(outer(id2,time,f),outer(id2,time,g))+rnorm(12*8*2,0,1),dim=c(12,8,2)))
plotTrajMeans3d(ld1)

##################
### Scaling by 'mean' and 'standard deviation'
plotTrajMeans3d(ld1)
scale(ld1)
plotTrajMeans3d(ld1)

### Scaling by some parameters
scale(ld1,center=c(10,100),scale=c(3,-1))
plotTrajMeans3d(ld1)

##################
### To restore the data
restoreRealData(ld1)



