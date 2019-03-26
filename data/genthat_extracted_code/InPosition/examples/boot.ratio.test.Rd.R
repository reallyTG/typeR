library(InPosition)


### Name: boot.ratio.test
### Title: Performs bootstrap ratio test.
### Aliases: boot.ratio.test
### Keywords: multivariate inference bootstrap

### ** Examples

	##the following code generates 100 bootstrap resampled 
	##projections of the measures from the Iris data set.
	data(ep.iris)
	data <- ep.iris$data
	design <- ep.iris$design
	iris.pca <- epGPCA(data,scale="SS1",DESIGN=design,make_design_nominal=FALSE)
	boot.fjs.unconstrained <- array(0,dim=c(dim(iris.pca$ExPosition.Data$fj),100))
	boot.fjs.constrained <- array(0,dim=c(dim(iris.pca$ExPosition.Data$fj),100))
	for(i in 1:100){
		#unconstrained means we resample any of the 150 flowers
		boot.fjs.unconstrained[,,i] <- boot.compute.fj(ep.iris$data,iris.pca)
		#constrained resamples within each of the 3 groups
		boot.fjs.constrained[,,i] <- boot.compute.fj(data,iris.pca,design,TRUE)		
	}
	#now compute the bootstrap ratios:
	ratios.unconstrained <- boot.ratio.test(boot.fjs.unconstrained)
	ratios.constrained <- boot.ratio.test(boot.fjs.constrained)



