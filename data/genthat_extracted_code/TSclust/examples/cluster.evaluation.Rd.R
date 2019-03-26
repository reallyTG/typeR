library(TSclust)


### Name: cluster.evaluation
### Title: Clustering Evaluation Index Based on Known Ground Truth
### Aliases: cluster.evaluation
### Keywords: ~kwd1 ~kwd2

### ** Examples


 #create a true cluster 
 #(first 4 elements belong to cluster '1', next 4 to cluster '2' and the last 4 to cluster '3'.
 true_cluster <- c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3)
 #the cluster to be tested
 new_cluster <- c( 2, 1, 2, 3, 3, 2, 2, 1, 3, 3, 3, 3)
 
 #get the index
 cluster.evaluation(true_cluster, new_cluster)
 
 #it can be seen that the index is not simmetric
 cluster.evaluation(new_cluster, true_cluster)



