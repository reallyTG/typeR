library(TSclust)


### Name: synthetic.tseries
### Title: Synthetic Time Series for Clustering Performace Comparisons.
### Aliases: synthetic.tseries

### ** Examples

data(synthetic.tseries)
#Create the true solution, for this dataset, there are three series of each model
true_cluster <- c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6)
#test a dissimilarity metric and a cluster algorithm
intperdist <- diss( synthetic.tseries, "INT.PER") #create the distance matrix
#use hierarchical clustering and divide the tree in 6 clusters
intperclust <- cutree( hclust(intperdist), 6 ) 
#use a cluster simmilarity index to rate the solution
cluster.evaluation( true_cluster, intperclust)

#test another dissimilarity metric and a cluster algorithm
acfdist <- diss( synthetic.tseries, "ACF", p=0.05) 
acfcluster <- pam( acfdist, 6 )$clustering #use pam clustering to form 6 clusters
cluster.evaluation( true_cluster, acfcluster)
## Not run: 
##D #test another dissimilarity metric and a cluster algorithm
##D chernoffdist <- diss( synthetic.tseries, "SPEC.LLR")
##D chernoffclust <- pam( chernoffdist, 6 )$clustering 
##D cluster.evaluation( true_cluster, chernoffclust)
## End(Not run)




