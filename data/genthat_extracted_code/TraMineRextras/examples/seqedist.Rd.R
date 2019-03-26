library(TraMineRextras)


### Name: seqedist
### Title: Distances between event sequences
### Aliases: seqedist
### Keywords: misc

### ** Examples

data(actcal.tse)
actcal.seqe <- seqecreate(actcal.tse[1:200,])[1:6,]
## We have 8 different event in this dataset
idcost <- rep(1, 8)
dd <- seqedist(actcal.seqe, idcost=idcost, vparam=.1)



