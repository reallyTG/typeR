library(ClustOfVar)


### Name: clust_diss
### Title: Calculates the aggregation criterion for two clusters of
###   variables
### Aliases: clust_diss

### ** Examples

data(decathlon)
A <- PCAmixdata::recod(X.quanti=decathlon[1:10,1:5], X.quali=NULL)$Z
B <- PCAmixdata::recod(X.quanti=decathlon[1:10,6:10], X.quali=NULL)$Z
clust_diss(A,B)



