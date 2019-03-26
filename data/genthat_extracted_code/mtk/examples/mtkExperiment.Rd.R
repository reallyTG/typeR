library(mtk)


### Name: mtkExperiment
### Title: The constructor of the class 'mtkExperiment'
### Aliases: mtkExperiment

### ** Examples


# Compute the sensitivity index with the method "Regression"
# over the model "Ishigami" according to an experiment design
# generated with the method "BasicMonteCarlo"

	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
     	distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

	ishiReg <- mtkExperiment(expFactors=ishi.factors,
		design="BasicMonteCarlo", designInfo=list(size=20),
		model="Ishigami", 
		analyze="Regression", analyzeInfo=list(nboot=20))
			
	run(ishiReg)
	summary(ishiReg)



