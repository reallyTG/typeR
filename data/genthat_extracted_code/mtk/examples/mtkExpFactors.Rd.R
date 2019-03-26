library(mtk)


### Name: mtkExpFactors
### Title: The constructor of the class 'mtkExpFactors'
### Aliases: mtkExpFactors

### ** Examples


# Create an object of the class mtkExpFactor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
	             distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
                     distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
                     distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))




