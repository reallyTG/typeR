library(mogavs)


### Name: mogavs-package
### Title: Package for regression variable selection with genetic algorithm
###   MOGA-VS
### Aliases: mogavs-package mogavs-package
### Keywords: package

### ** Examples

data(sampleData)
mod <- mogavs(y~.,data=sampleData,maxGenerations=20)
summary(mod)
createAdditionalPlots(mod,epsilonBand=0,kBest=30,"kbest")



