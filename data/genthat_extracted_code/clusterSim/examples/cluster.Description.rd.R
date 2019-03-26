library(clusterSim)


### Name: cluster.Description
### Title: Descriptive statistics calculated separately for each cluster
###   and variable
### Aliases: cluster.Description
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_ratio)
cl <- pam(data_ratio,5)
desc <- cluster.Description(data_ratio,cl$cluster)
print(desc)



