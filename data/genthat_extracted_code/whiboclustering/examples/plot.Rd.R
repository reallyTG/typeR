library(whiboclustering)


### Name: plot.whibo_cluster
### Title: Plot WhiBo Cluster Representatives
### Aliases: plot.whibo_cluster

### ** Examples

data <- iris[, 1:4] #Numerical data only

model <- whibo_clustering(data = data, k = 3)
plot(model)




