library(ClustOfVar)


### Name: clusterscore
### Title: Calculates de synthetic variable of a cluster
### Aliases: clusterscore

### ** Examples

data(decathlon)
A <- 1:5
Z <- PCAmixdata::recod(X.quanti=decathlon[1:10,A], X.quali=NULL)$Z
clusterscore(Z)
Z%*%as.matrix(clusterscore(Z)$v)
clusterscore(Z)$f



