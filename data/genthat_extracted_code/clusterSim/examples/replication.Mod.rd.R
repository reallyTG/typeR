library(clusterSim)


### Name: replication.Mod
### Title: Modification of replication analysis for cluster validation
### Aliases: replication.Mod
### Keywords: cluster multivariate

### ** Examples

library(clusterSim)
data(data_ratio)
w <- replication.Mod(data_ratio, u=5, S=10)
print(w)

library(clusterSim)
data(data_binary)
replication.Mod(data_binary,"b", u=2, "medoids", NULL,"b1", "pam", fixedAsample=c(1,3,6,7))



