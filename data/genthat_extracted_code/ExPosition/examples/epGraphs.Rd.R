library(ExPosition)


### Name: epGraphs
### Title: epGraphs: ExPosition plotting function
### Aliases: epGraphs
### Keywords: multivariate graphs misc

### ** Examples

	#this is for ExPosition's iris data
	data(ep.iris)
	pca.iris.res <- epPCA(ep.iris$data)
	#this will put plotting data into a new variable.
	epGraphs.2.and.3 <- epGraphs(pca.iris.res,x_axis=2,y_axis=3)



