library(mtk)


### Name: getWeights-methods
### Title: The 'getWeights' method
### Aliases: getWeights-methods getWeights

### ** Examples


# Create a discrete domain
	x1 <- mtkDomain(distributionName="discrete", domainNominalValue=0,
		 distributionParameters=list(type='categorical',
		 levels = c(1,2,3,4,5), weights=rep(0.2, 5)))
# Returns the weights of the associated discrete distribution
	getWeights(x1)
		 





