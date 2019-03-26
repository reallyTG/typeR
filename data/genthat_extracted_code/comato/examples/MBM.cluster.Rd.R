library(comato)


### Name: MBM.cluster
### Title: MBMM clustering
### Aliases: MBM.cluster

### ** Examples

#Random data generation, 100 observations, 5 dimensions, dependencies within the dimensions
data = cbind(round(runif(100)), round(runif(100)), round(runif(100)))
data = cbind(data, data[,2], 1-data[,3])

#Noisy data:
s = round(runif(2, 1, 100))
data[s, c(4,5)] = 1 - data[s, c(4,5)]

#MBMM Clustering
res = MBM.cluster(data, 1,8)



