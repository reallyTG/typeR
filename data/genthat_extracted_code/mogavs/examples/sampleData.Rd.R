library(mogavs)


### Name: sampleData
### Title: Simulated Data Set for MOGA-VS
### Aliases: sampleData
### Keywords: datasets

### ** Examples

data(sampleData)
ans <- mogavs(as.matrix(sampleData)[,-1],as.matrix(sampleData)[,1],maxGenerations=10)



