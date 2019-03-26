library(whiboclustering)


### Name: summary.whibo_cluster
### Title: Show White-Box Cluster Algorithm model
### Aliases: summary.whibo_cluster

### ** Examples

data <- iris[, 1:4] #Numerical data only

model <- whibo_clustering(data = data, k = 3)
summary(model)




