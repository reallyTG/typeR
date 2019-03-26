library(optCluster)


### Name: arabid
### Title: Subset of Arabidopsis RNA-Seq Data
### Aliases: arabid
### Keywords: datasets

### ** Examples

	
	## These examples may each take a few minutes to compute
	## No test: 
	## Obtain Dataset
	data(arabid)
			
	## Analysis of Count Data using Internal and Stability Validation Measures
	count1 <- optCluster(arabid, 2:4, clMethods = "all", countData = TRUE)
	topMethod(count1)
	
	## Analysis of Normalized Data using Internal and Stability Validation Measures
	obj <- t(t(arabid)/colSums(arabid)) ## Normalized with Respect to Library Size
	norm1 <- optCluster(obj, 2:4, clMethods = "all")
	topMethod(norm1)
	
	
## End(No test)




