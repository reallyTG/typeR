library(optCluster)


### Name: aggregPlot
### Title: Rank Aggregation Plot
### Aliases: aggregPlot

### ** Examples

	
	## This example may take a few minutes to compute
	## No test: 
	## Obtain Dataset
	data(arabid)
		
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))
	
	## Analysis of Normalized Data using Internal and Stability Validation Measures
	norm1 <- optCluster(obj, 2:4, clMethods = "all")
	aggregPlot(norm1)
	
	
## End(No test)



