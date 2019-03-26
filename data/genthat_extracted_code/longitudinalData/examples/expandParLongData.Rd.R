library(longitudinalData)


### Name: expandParLongData
### Title: ~ Function: expandParLongData ~
### Aliases: expandParLongData
###   expandParLongData,ParLongData,Partition-method
###   expandParLongData,ParLongData,numeric-method

### ** Examples

###################
### Some parameters for trajectories
(paramTraj <- parTRAJ(col="clusters"))

### Expand to a small partition with 3 clusters
part <- partition(LETTERS[rep(1:3,4)])
expandParLongData(paramTraj,part)


###################
### Some parameters for the mean trajectories
paramMean <- parMEAN()

### If there is 3 clusters :
expandParLongData(paramMean,3)

### If there is 5 clusters :
expandParLongData(paramMean,5)



