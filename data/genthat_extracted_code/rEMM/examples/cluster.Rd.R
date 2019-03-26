library(rEMM)


### Name: cluster
### Title: Data stream clustering with tNN
### Aliases: cluster cluster,tNN,data.frame-method
###   cluster,tNN,matrix-method cluster,tNN,numeric-method
### Keywords: models cluster

### ** Examples

## load EMMTraffic data
data(EMMTraffic)

## create empty clustering
tnn <- tNN(th=0.2, measure="eJaccard")
tnn

## cluster some data
cluster(tnn, EMMTraffic)
tnn

## what clusters were the data points assigned to?
last_clustering(tnn)

## plot the clustering as a scatterplot matrix of the cluster centers
plot(tnn)



