library(mtk)


### Name: setFactors-methods
### Title: The 'setFactors' method
### Aliases: setFactors-methods setFactors

### ** Examples


# Build an object of the "mtkExpFactors" class
	ishi.factors <- mtkExpFactors()
	
# Define the factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
   	 	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
   	  	distribPara=list(min=-pi, max=pi))
# Assign the factors to the mtkExpFactors' object

	setFactors(ishi.factors, list(x1,x2,x3))



