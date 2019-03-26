library(OpenMx)


### Name: myGrowthKnownClassData
### Title: Data for a growth mixture model with the true class membership
### Aliases: myGrowthKnownClassData
### Keywords: datasets

### ** Examples

data(myGrowthKnownClassData)

#plot the observed trajectories
# blue lines are class 1, green lines are class 2
colSel <-c('blue', 'green')[myGrowthKnownClassData$c]
matplot(t(myGrowthKnownClassData[,-6]), type='l', lty=1, col=colSel)




