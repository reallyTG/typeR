library(funcy)


### Name: makeCommonTime
### Title: Create appropriate evaluation time points.
### Aliases: makeCommonTime

### ** Examples

##sample an irregular dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=100, k=4, timeNrMin=5, timeNrMax=10, reg=FALSE)
makeCommonTime(Data(ds), 10)



