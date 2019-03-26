library(bingat)


### Name: plotMDS
### Title: Plot MDS
### Aliases: plotMDS

### ** Examples

	data(braingraphs)
	
	### Break our data into two groups
	dataList <- list(braingraphs[,1:19], braingraphs[,20:38])
	
	### Basic plot
	plotMDS(dataList, main="MDS Plot")
	
	### Paired Plot
	plotMDS(dataList, paired=TRUE, main="Paired MDS Plot")



