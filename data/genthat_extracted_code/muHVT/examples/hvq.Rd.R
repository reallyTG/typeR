library(muHVT)


### Name: hvq
### Title: hvq
### Aliases: hvq

### ** Examples


data("USArrests",package="datasets")
hvqOutput = hvq(USArrests, nclust = 2, depth = 3, quant.err = 0.2,
distance_metric='L1_Norm',error_metric='mean')





