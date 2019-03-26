library(bingat)


### Name: pairedPvalue
### Title: P-Value for Paired Data Results
### Aliases: pairedPvalue

### ** Examples

	data(braingraphs)
	
	### Break our data into two groups
	dataList <- list(braingraphs[,1:19], braingraphs[,20:38])
	
	### We use 1 for speed, should be at least 1,000
	numPerms <- 1
	
	pval <- pairedPvalue(dataList, "adjMatrix", numPerms=numPerms) 
	pval



