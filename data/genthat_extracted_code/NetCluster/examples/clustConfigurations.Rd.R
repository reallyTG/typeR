library(NetCluster)


### Name: clustConfigurations
### Title: Fit of Cluster Configurations for Networks
### Aliases: clustConfigurations
### Keywords: ~sna

### ** Examples

	# Generate socmatrix
	socmatrix = matrix(c(1,1,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,1,0), nrow = 5, ncol = 5)
	socmatrix 
	socmatrix_cors <- cor(socmatrix)
	socmatrix_cors
	
	# To use correlation values in hierarchical clustering, they must 
	# first be coerced into a "dissimilarity structure" using dist().
	# We subtract the values from 1 so that they are all greater than 
	# or equal to 0; thus, highly dissimilar (i.e., negatively 
	# correlated) actors have higher values.
	dissimilarity <- 1 - socmatrix_cors
	socmatrix_dist <- as.dist(dissimilarity)
	socmatrix_dist
	
	# hclust() performs a hierarchical agglomerative clustering 
	# operation based on the values in the dissimilarity matrix 
	# yielded by as.dist() above. The standard visualization is a 
	# dendrogram. 
	socmatrix_hclust <- hclust(socmatrix_dist)
	plot(socmatrix_hclust)
	
	# cutree() allows us to use the output of hclust() to set
	# different numbers of clusters and assign vertices to clusters
	# as appropriate. For example:
	cutree(socmatrix_hclust, k=2)
	
	# Now we'll try to figure out the number of clusters that best 
	# describes the underlying data. To do this, we'll loop through
	# all of the possible numbers of clusters (1 through n, where n is
	# the number of actors in the network). For each solution
	# corresponding to a given number of clusters, we'll use cutree()
	# to assign the vertices to their respective clusters 
	# corresponding to that solution.
	#
	# From this, we can generate a matrix of within- and between-
	# cluster correlations. Thus, when there is one cluster for each 
	# vertex in the network, the cell values will be identical to the
	# observed correlation matrix, and when there is one cluster for 
	# the whole network, the values will all be equal to the average
	# correlation across the observed matrix.
	#
	# We can then correlate each by-cluster matrix with the observed
	# correlation matrix to see how well the by-cluster matrix fits
	# the data. We'll store the correlation for each number of
	# clusters in a vector, which we can then plot.
	
	# First, find n:
	num_vertices = ncol(socmatrix)
	
	# Next, use the clustConfigurations function:
	clustered_observed_cors <-clustConfigurations(num_vertices,socmatrix_hclust,socmatrix_cors)
	
	# Choose n where the line starts to flatten beyond 45 degrees. 
	# Three looks like a good number for this example.
	
	num_clusters = 3
	
	clusters <- cutree(socmatrix_hclust, k = num_clusters)
	clusters
	
	( cluster_cor_mat <- clusterCorr(socmatrix_cors, clusters) )



