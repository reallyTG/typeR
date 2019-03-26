library(InPosition)


### Name: boot.samples
### Title: Compute indicies for bootstrap resampling.
### Aliases: boot.samples
### Keywords: bootstrap

### ** Examples

	data(ep.iris)
	unconstrained.indices <- boot.samples(ep.iris$data)
	#ep.iris$data[unconstrained.indices,]
	constrained.indices <- boot.samples(ep.iris$data,DESIGN=ep.iris$design,constrained=TRUE)
	#ep.iris$data[constrained.indices,]	



