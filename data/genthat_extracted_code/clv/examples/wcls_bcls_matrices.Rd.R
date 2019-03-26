library(clv)


### Name: wcls/bcls.matrix
### Title: Matrix Cluster Scatter Measures
### Aliases: wcls.matrix bcls.matrix
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
pam.mod <- pam(iris.data,5) # create five clusters
v.pred <- as.integer(pam.mod$clustering) # get cluster ids associated to given data objects

# compute cluster sizes, center of each cluster 
# and mean from data objects
cls.attr <- cls.attrib(iris.data, v.pred)
center <- cls.attr$cluster.center
size <- cls.attr$cluster.size
iris.mean <- cls.attr$mean

# compute matrix scatter measures
W.matrix <- wcls.matrix(iris.data, v.pred, center)
B.matrix <- bcls.matrix(center, size, iris.mean)
T.matrix <- W.matrix + B.matrix

# example of indices based on W, B i T matrices
mx.scatt.crit1 = sum(diag(W.matrix))
mx.scatt.crit2 = sum(diag(B.matrix))/sum(diag(W.matrix))
mx.scatt.crit3 = det(W.matrix)/det(T.matrix)



