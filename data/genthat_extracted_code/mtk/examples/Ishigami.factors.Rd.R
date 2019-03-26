library(mtk)


### Name: Ishigami.factors
### Title: Input factors of the 'Ishigami' model
### Aliases: Ishigami.factors
### Keywords: datasets

### ** Examples

# The code used to generate the Ishigami.factors is as follows:

	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))
     
	Ishigami.factors <- mtkExpFactors(list(x1,x2,x3))
	
# To import the Ishigami.factors, just use the following line
	data(Ishigami.factors)



