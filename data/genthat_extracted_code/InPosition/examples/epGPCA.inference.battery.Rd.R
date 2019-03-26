library(InPosition)


### Name: epGPCA.inference.battery
### Title: epGPCA.inference.battery: Inference tests for Generalized
###   Principal Component Analysis (PCA) via InPosition.
### Aliases: epGPCA.inference.battery
### Keywords: multivariate permutation bootstrap

### ** Examples

	#this is for ExPosition's iris data
	data(ep.iris)
	data<-ep.iris$data
	design<-ep.iris$design
	gpca.iris.res <- epGPCA.inference.battery(data,DESIGN=design,make_design_nominal=FALSE)



