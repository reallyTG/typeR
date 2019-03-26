library(TSclust)


### Name: paired.tseries
### Title: Pairs of Time Series from Different Domains
### Aliases: paired.tseries
### Keywords: datasets

### ** Examples

data(paired.tseries)
#Create the true solution, the pairs
true_cluster <- rep(1:18, each=2)
#test a dissimilarity metric and a cluster algorithm
intperdist <- diss( paired.tseries, "INT.PER") #create the distance matrix
#use hierarchical clustering and divide the tree in 18 clusters
intperclust <- cutree( hclust(intperdist), k=18 )
#use a cluster simmilarity index to rate the solution
cluster.evaluation( true_cluster, intperclust)

#### other evaluation criterion used in this dataset  consist in counting the correct pairs
#### formed during agglomerative hierarchical cluster (see references)
true_pairs = (-matrix(1:36, ncol=2, byrow=TRUE))
hcintper <- hclust(intperdist, "complete")
#count within the hierarchical cluster the pairs
sum( match(data.frame(t(true_pairs)), data.frame(t(hcintper$merge)), nomatch=0) > 0 ) / 18




