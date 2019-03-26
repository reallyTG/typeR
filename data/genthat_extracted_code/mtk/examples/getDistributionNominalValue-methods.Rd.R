library(mtk)


### Name: getDistributionNominalValue-methods
### Title: The 'getDistributionNominalValue' method
### Aliases: getDistributionNominalValue-methods
###   getDistributionNominalValue

### ** Examples

# Create a a factor with a nominal value
	
	x1 <- make.mtkFactor(name="x1", type='numeric', nominal=0.0, distribName="unif",
	             distribPara=list(min=-pi, max=pi))
	
	getDistributionNominalValue(x1)





