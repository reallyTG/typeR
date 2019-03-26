library(mtk)


### Name: getDistributionNominalValueTypes-methods
### Title: The 'getDistributionNominalValueTypes' method
### Aliases: getDistributionNominalValueTypes-methods
###   getDistributionNominalValueTypes

### ** Examples

# Define three factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
 		 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))

# Build an object of the "mtkExpFactors" class
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

# Return the nominal values
	nTypes <- getDistributionNominalValueTypes(ishi.factors)



