library(mtk)


### Name: getDiscreteDistributionType-methods
### Title: The 'getDiscreteDistributionType' method
### Aliases: getDiscreteDistributionType-methods
###   getDiscreteDistributionType

### ** Examples


# Create a discrete domain
	x1 <- make.mtkFactor(name="x1", distribName="discrete",
		 distribPara= list(type='categorical',
		 levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
# Returns the type of the associated discrete distribution
	getDiscreteDistributionType(x1)
		 





