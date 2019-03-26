library(bingat)


### Name: lrtPvalue
### Title: Likelihood Ratio Test
### Aliases: lrtPvalue

### ** Examples

	data(braingraphs)
	
	### Break our data into two groups
	dataList <- list(braingraphs[,1:19], braingraphs[,20:38])
	
	### We use 1 for speed, should be at least 1,000
	numPerms <- 1
	
	lrt <- lrtPvalue(dataList, "adjMatrix", numPerms=numPerms) 
	lrt	



