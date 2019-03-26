library(Publish)


### Name: CiTable
### Title: CiTable data
### Aliases: CiTable
### Keywords: datasets

### ** Examples


data(CiTable)
labellist <- split(CiTable[,c("Dose","Mean","SD","n")],CiTable[,"Drug"])
labellist
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")], labels=labellist)





