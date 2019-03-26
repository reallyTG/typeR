library(InPosition)


### Name: inGraphs
### Title: inGraphs: InPosition plotting function
### Aliases: inGraphs
### Keywords: misc multivariate permutation bootstrap graphs

### ** Examples

	data(ep.iris)
	data<-ep.iris$data
	design<-ep.iris$design
	gpca.iris.res <- epGPCA.inference.battery(data,DESIGN=design,make_design_nominal=FALSE)
	inGraphs(gpca.iris.res,y_axis=3)



