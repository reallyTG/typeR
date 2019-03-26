library(mtk)


### Name: getDiscreteDistributionLevels-methods
### Title: The 'getDiscreteDistributionLevels' method
### Aliases: getDiscreteDistributionLevels-methods
###   getDiscreteDistributionLevels

### ** Examples


# Create a discrete domain
	x1 <- make.mtkFactor(name="x1", distribName="discrete",
		 distribPara= list(type='categorical',
		 levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
		 
# Returns the levels of the associated discrete distribution
	getDiscreteDistributionLevels(x1)
		 





