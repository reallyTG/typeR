library(mtk)


### Name: getDistributionNominalValueType-methods
### Title: The 'getDistributionNominalValueType' method
### Aliases: getDistributionNominalValueType-methods
###   getDistributionNominalValueType

### ** Examples

# Create a a factor with a nominal value
	
	x1 <- make.mtkFactor(name="x1", type='numeric', nominal=0.0, distribName="unif",
	             distribPara=list(min=-pi, max=pi))
	
	getDistributionNominalValueType(x1)





