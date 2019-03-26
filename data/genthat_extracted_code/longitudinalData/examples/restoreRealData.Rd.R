library(longitudinalData)


### Name: restoreRealData
### Title: ~ Function: restoreRealData ~
### Aliases: restoreRealData restoreRealData,LongData
###   restoreRealData,LongData3d restoreRealData,LongData-method
###   restoreRealData,LongData3d-method

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
scale(ld1,scale=c(-1,-1))
plotTrajMeans3d(ld1)

##################
### Back to the first version of the data
restoreRealData(ld1)
plotTrajMeans3d(ld1)



