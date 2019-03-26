library(VIM)


### Name: kNN
### Title: k-Nearest Neighbour Imputation
### Aliases: gowerD kNN maxCat sampleCat which.minN
### Keywords: manip

### ** Examples


data(sleep)
kNN(sleep)
library(laeken)
kNN(sleep, numFun = weightedMean, weightDist=TRUE)




