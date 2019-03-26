library(mogavs)


### Name: createAdditionalPlots
### Title: Function for plotting boundaries of the archive set.
### Aliases: createAdditionalPlots
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,data=sampleData,maxGenerations=20)
createAdditionalPlots(mod,epsilonBand=0,kBest=15,"kbest")
createAdditionalPlots(mod,epsilonBand=0.001,method="mse")




