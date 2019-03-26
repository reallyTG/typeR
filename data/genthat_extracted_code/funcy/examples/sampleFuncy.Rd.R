library(funcy)


### Name: sampleFuncy
### Title: Simulate functional data.
### Aliases: sampleFuncy Cluster,sampleFuncy-method Data
###   Data,sampleFuncy-method
### Keywords: datasets

### ** Examples

##sample a regular dataset
set.seed(2705)
ds <- sampleFuncy(obsNr=100, k=4, timeNr=20, reg=TRUE)
plotFuncy(ds)

##sample an irregular dataset
set.seed(2705)
ds <- sampleFuncy(obsNr=100, k=4, timeNrMin=3, timeNrMax=10, reg=FALSE)
plotFuncy(ds, lty=1)



