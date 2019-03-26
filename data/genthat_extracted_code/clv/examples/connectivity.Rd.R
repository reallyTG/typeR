library(clv)


### Name: connectivity
### Title: Connectivity Index - Internal Measure
### Aliases: connectivity connectivity.diss.mx
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
pam.mod <- pam(iris.data,5) # create five clusters
v.pred <- as.integer(pam.mod$clustering) # get cluster ids associated to gived data objects

# compute connectivity index using data and its clusterization
conn1 <- connectivity(iris.data, v.pred, 10)
conn2 <- connectivity(iris.data, v.pred, 10, dist="manhattan")
conn3 <- connectivity(iris.data, v.pred, 10, dist="correlation")

# the same using dissimilarity matrix
iris.diss.mx <- as.matrix(daisy(iris.data))
conn4 <- connectivity.diss.mx(iris.diss.mx, v.pred, 10)



