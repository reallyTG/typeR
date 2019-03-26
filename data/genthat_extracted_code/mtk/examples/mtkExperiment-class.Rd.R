library(mtk)


### Name: mtkExperiment-class
### Title: The 'mtkExperiment' class
### Aliases: mtkExperiment-class
###   addProcess,mtkExperiment,mtkProcess,character-method
###   deleteProcess,mtkExperiment,character-method
###   setProcess,mtkExperiment,mtkProcess,character-method
###   getProcess,mtkExperiment,character-method
###   extractData,mtkExperiment,character-method
###   reevaluate,mtkExperiment,character-method
###   serializeOn,mtkExperiment-method run,mtkExperiment,missing-method
###   summary,mtkExperiment-method print,mtkExperiment-method
###   plot,mtkExperiment-method report,mtkExperiment-method

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
	factors <- mtkExpFactors(list(x1,x2,x3))

	exp <- mtkExperiment(
		factors, 
		design = 'BasicMonteCarlo',
		designInfo=list(size=20),
		model = 'Ishigami', 
		analyze = 'Regression', 
		analyzeInfo = list(ntboot=20)
		)
	run(exp)
	summary(exp)



