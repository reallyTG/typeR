library(optCluster)


### Name: optCluster-class
### Title: Class "optCluster"
### Aliases: optClusterObj optCluster-class getDataset,optCluster-method
###   getClValid,optCluster-method methodRanks,optCluster-method
###   scoreRanks,optCluster-method getRankAggreg,optCluster-method
###   topMethod,optCluster-method measureNames,optCluster-method
###   methodNames,optCluster-method clusterResults,optCluster-method
###   valScores,optCluster-method optimalScores,optCluster-method
###   optAssign,optCluster-method getDataset getClValid methodRanks
###   scoreRanks getRankAggreg topMethod measureNames methodNames
###   clusterResults valScores optimalScores optAssign
###   print,optCluster-method show,optCluster-method
###   summary,optCluster-method
### Keywords: classes cluster optimize

### ** Examples

	
	## This example may take a few minutes to compute
	## No test: 
	## Obtain Dataset	
	data(arabid)	
	
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))
	
	## Analysis of Normalized Data using Internal and Stability Measures
	norm1 <- optCluster(obj, 2:4, clMethods = "all")

	## View results
	norm1
	topMethod(norm1)
	summary(norm1)
	optimalScores(norm1)
	optAssign(norm1)
	
	## Extract cluster results for kmeans and all numbers of clusters
	clusterResults(norm1, method = "kmeans")
	## Extract cluster results for kmeans and 3 clusters only
	clusterResults(norm1, method = "kmeans", k = 3)
	
	## Extract all validation scores
	valScores(norm1)
	## Extract validations scores for APN and ADM only
	valScores(norm1, measures = c("APN", "ADM"))
	
	## Extract additional information from slots
	methodNames(norm1)
	measureNames(norm1)
	methodRanks(norm1)
	scoreRanks(norm1)
	
## End(No test)




