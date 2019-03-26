library(whiboclustering)


### Name: print.whibo_cluster
### Title: Show White-Box Cluster Algorithm model
### Aliases: print.whibo_cluster

### ** Examples

data <- iris[, 1:4] #Numerical data only

model <- whibo_clustering(data = data, k = 3)
print(model)




