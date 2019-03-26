library(optCluster)


### Name: repRankAggreg
### Title: Repeat Rank Aggregation
### Aliases: repRankAggreg

### ** Examples

	
	## These examples may take a few minutes to compute
	## No test: 
	
	## Obtain Dataset	
	data(arabid)			
	
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))
	
	## Analysis of Normalized Data using Internal and Stability Validation Measures
	norm1 <- optCluster(obj, 2:4, clMethods = "all")
	print(norm1)
	repCE <- repRankAggreg(norm1)
	print(repCE)
	repGA <- repRankAggreg(norm1, rankMethod = "GA")
	print(repGA)
	
## End(No test)
	



