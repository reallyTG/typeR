library(rEMM)


### Name: EMM
### Title: Creator for Class "EMM"
### Aliases: EMM object.size,EMM-method
### Keywords: models

### ** Examples

## load EMMTraffic data
data(EMMTraffic)

## create empty EMM
emm <- EMM(threshold=0.2, measure="eJaccard", lambda=.1)
emm

## cluster some data
build(emm, EMMTraffic)
emm

## what clusters were the data points assigned to?
last_clustering(emm)

## plot the clustering as a graph
plot(emm)



