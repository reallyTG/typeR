library(mtk)


### Name: mtkFactor-class
### Title: The 'mtkFactor' class
### Aliases: mtkFactor-class initialize,mtkFactor-method
###   setFeatures,mtkFactor,list-method getFeatures,mtkFactor-method
###   getMTKFeatures,mtkFactor-method getName,mtkFactor-method
###   setName,mtkFactor,character-method getType,mtkFactor-method
###   setType,mtkFactor,character-method getDomain,mtkFactor-method
###   setDomain,mtkFactor,mtkDomain-method
###   getDistributionName,mtkFactor-method
###   getDistributionNominalValue,mtkFactor-method
###   getDistributionNominalValueType,mtkFactor-method
###   getDistributionParameters,mtkFactor-method
###   getDiscreteDistributionType,mtkFactor-method
###   getDiscreteDistributionLevels,mtkFactor-method
###   getDiscreteDistributionWeights,mtkFactor-method
###   print,mtkFactor-method show,mtkFactor-method

### ** Examples


# Manage a factor x1 with  a mtkFactor object.

	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi)) 
	getName(x1)
	getDomain(x1)
	getDistributionName(x1)
	getType(x1) 
	setType(x1, "double")
	getType(x1); # 'double'



