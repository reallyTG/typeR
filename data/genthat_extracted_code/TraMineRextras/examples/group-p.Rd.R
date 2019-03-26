library(TraMineRextras)


### Name: group.p
### Title: Adds proportion of occurrences to each level names
### Aliases: group.p
### Keywords: util

### ** Examples

data(actcal)
actcal <- actcal[1:100,]
actcal.seq <- seqdef(actcal[,13:24])
seqdplot(actcal.seq, group=group.p(actcal$sex))

levels(group.p(actcal$sex, weights=runif(length(actcal$sex))))



