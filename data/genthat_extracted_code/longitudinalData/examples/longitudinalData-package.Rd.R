library(longitudinalData)


### Name: longitudinalData-package
### Title: ~ Package overview: longitudinalData ~
### Aliases: longitudinalData longitudinalData-package
### Keywords: package dplot classif cluster

### ** Examples

### Generation of artificial longData
data(artificialJointLongData)
myData <- longData3d(artificialJointLongData,timeInData=list(var1=2:12,var2=13:23,var3=24:34))

part <- partition(rep(1:3,each=50))
plotTrajMeans3d(myData,part)

### Quality criterion
qualityCriterion(myData,part)



