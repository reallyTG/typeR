library(optCluster)


### Name: optHeatmap
### Title: Optimal Hierarchical Clustering Heat Map
### Aliases: optHeatmap

### ** Examples

	## Obtain Dataset	
	data(arabid)			
	
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))	
	
	## Analysis with Only UPGMA using Internal and Stability Validation Measures
	hier1 <- optCluster(obj, 2:10, clMethods = "hierarchical")
	topMethod(hier1)

	## Create Default Heat Map Reordering Rows Only
	optHeatmap(hier1)
	
	## Create a Heat Map Reordering Both Rows and Columns
	optHeatmap(hier1, Colv = TRUE, dendrogram = "both")
	
	## Customized Heat Map Using Several heatmap.2 Arguments
	optHeatmap(hier1, Colv = TRUE, dendrogram = "both", 
	labRow = "", cexCol = 1.0, keysize = 1)





