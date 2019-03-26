library(optCluster)


### Name: optCluster
### Title: Determine Optimal Clustering Algorithm and Number of Clusters
### Aliases: optCluster
### Keywords: cluster optimize

### ** Examples

	
	## These examples may each take a few minutes to compute
	## No test: 
	## Obtain Dataset	
	data(arabid)	
		
	## Analysis of Count Data using Internal and Stability Validation Measures
	count1 <- optCluster(arabid, 2:4, clMethods = "all", countData = TRUE)
	summary(count1)
	# Obtain optimal clustering assignment
	optAssign(count1)
	
	
	
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))
		
	## Analysis of Normalized Data using Internal and Stability Validation Measures
	norm1 <- optCluster(obj, 2:4, clMethods = "all")
	summary(norm1)
	# Obtain optimal clustering assignment
	optAssign(norm1)
	#Obtain clustering assignment for diana with 2 clusters
	clusterResults(norm1, "diana", k = 2)$cluster
	
	 ## Analysis of Normalized Data using All Validation Measures
	 if(require("Biobase") && require("annotate") && require("GO.db") && 
	 	require("org.At.tair.db")){
	 norm2 <- optCluster(obj, 2:4, clMethods = "all", validation = "all", 
					annotation = "org.At.tair.db")
	 summary(norm2)
	 }
	
	## Analysis with Only UPGMA using Internal and Stability Validation Measures
	hier1 <- optCluster(obj, 2:10, clMethods = "hierarchical")
	summary(hier1)
	
	
## End(No test)



