library(ExPosition)


### Name: epMDS
### Title: epMDS: Multidimensional Scaling (MDS) via ExPosition.
### Aliases: epMDS
### Keywords: multivariate

### ** Examples
	
	data(jocn.2005.fmri)
	#by default, components 1 and 2 will be plotted.
	mds.res.images <- epMDS(jocn.2005.fmri$images$data)

	##iris example
	data(ep.iris)
	iris.rectangular <- epMDS(ep.iris$data,DATA_is_dist=FALSE)
	iris.euc.dist <- dist(ep.iris$data,upper=TRUE,diag=TRUE)
	iris.sq.euc.dist <- as.matrix(iris.euc.dist^2)
	iris.sq <- epMDS(iris.sq.euc.dist)



