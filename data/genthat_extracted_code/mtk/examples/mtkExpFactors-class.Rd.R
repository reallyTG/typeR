library(mtk)


### Name: mtkExpFactors-class
### Title: The 'mtkExpFactors' class
### Aliases: mtkExpFactors-class [,mtkExpFactors-method
###   [[,mtkExpFactors-method $,mtkExpFactors-method
###   initialize,mtkExpFactors-method setFactors,mtkExpFactors,list-method
###   getFactors,mtkExpFactors-method getNames,mtkExpFactors-method
###   getDistributionNames,mtkExpFactors-method
###   getDistributionParameters,mtkExpFactors-method
###   getFactorNames,mtkExpFactors-method
###   getFactorFeatures,mtkExpFactors-method
###   getDistributionNominalValues,mtkExpFactors-method
###   getDistributionNominalValueTypes,mtkExpFactors-method
###   print,mtkExpFactors-method show,mtkExpFactors-method

### ** Examples


# Define the factor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
   	 	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
   	  	distribPara=list(min=-pi, max=pi))

# Build an object of the "mtkExpFactors" class
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))



