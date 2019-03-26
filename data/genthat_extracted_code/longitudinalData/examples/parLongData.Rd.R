library(longitudinalData)


### Name: parLongData
### Title: ~ Function: parLongData, parTraj and parMean~
### Aliases: parLongData parTRAJ parMEAN
### Keywords: methods

### ** Examples

##################
### Construction of LongData

time=c(1,2,3,4,8,12,16,20)
id2=1:120
f <- function(id,t)((id-1)%%3-1) * t
g <- function(id,t)(id%%2+1)*t
ld2 <- longData3d(
   array(cbind(outer(id2,time,f),outer(id2,time,g))+rnorm(120*8*2,0,3),
   dim=c(120,8,2)))

### Example with default value
plotTrajMeans3d(ld2)
plotTrajMeans3d(ld2,parTraj=parTRAJ())

### Example with default value except for the color
plotTrajMeans3d(ld2,parTraj=parTRAJ(col="blue"))



