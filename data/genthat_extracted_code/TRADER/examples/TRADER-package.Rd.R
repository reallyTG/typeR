library(TRADER)


### Name: TRADER-package
### Title: Tree Ring Analysis of Disturbance Events in R
### Aliases: TRADER-package TRADER
### Keywords: package

### ** Examples

data(relData)

plotFirstYears(relData1)
plotGrowth(relData1)

absoluteIncreaseALL(relData1,length=3,buffer=4,storedev=jpeg)
growthAveragingALL(relData1,length=3,buffer=4,storedev=pdf)
boundaryLineALL(relData1,length=2,buffer=2,storedev=pdf,
  boundary=function(x) {5.0067*exp(-0.664*x)} )  
splechtnaALL(relData1,length=3,buffer=4,storedev=pdf,
  boundary=function(x) {5.0067*exp(-0.664*x)} )
doAll(relData1,length=3,buffer=4,storedev=pdf)

knownBL



