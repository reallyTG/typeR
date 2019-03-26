library(bingat)


### Name: glrtPvalue
### Title: GLRT Regression Results
### Aliases: glrtPvalue

### ** Examples

	data(braingraphs)
	
	### Break our data into two groups
	dataList <- list(braingraphs[,1:19], braingraphs[,20:38])
	
	### We use 1 for speed, should be at least 1,000
	numPerms <- 1
	
	res <- glrtPvalue(dataList, "adjMatrix", numPerms=numPerms) 
	res$pvalue



