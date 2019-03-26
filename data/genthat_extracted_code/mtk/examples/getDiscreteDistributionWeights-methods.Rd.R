library(mtk)


### Name: getDiscreteDistributionWeights-methods
### Title: The 'getDiscreteDistributionWeights' method
### Aliases: getDiscreteDistributionWeights-methods
###   getDiscreteDistributionWeights

### ** Examples


# Create a discrete domain
	x1 <- make.mtkFactor(name="x1", distribName="discrete",
		 distribPara= list(type='categorical',
		 levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
# Returns the weights of the associated discrete distribution
	getDiscreteDistributionWeights(x1)
		 





