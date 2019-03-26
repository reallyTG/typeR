library(mtk)


### Name: mtkIshigamiEvaluator-class
### Title: The 'mtkIshigamiEvaluator' class
### Aliases: mtkIshigamiEvaluator-class
###   is.ready,mtkIshigamiEvaluator-method
###   setReady,mtkIshigamiEvaluator,logical-method
###   is.finished,mtkIshigamiEvaluator-method
###   setState,mtkIshigamiEvaluator,logical-method
###   setName,mtkIshigamiEvaluator,character-method
###   setParameters,mtkIshigamiEvaluator,vector-method
###   getParameters,mtkIshigamiEvaluator-method
###   getResult,mtkIshigamiEvaluator-method
###   getData,mtkIshigamiEvaluator-method
###   serializeOn,mtkIshigamiEvaluator-method
###   run,mtkIshigamiEvaluator,mtkExpWorkflow-method
###   summary,mtkIshigamiEvaluator-method print,mtkIshigamiEvaluator-method
###   plot,mtkIshigamiEvaluator-method report,mtkIshigamiEvaluator-method

### ** Examples


# Carry out a sensitivity analysis with the Ishigami model

##	Input the factors
	data(Ishigami.factors)

##	Specify the experiments designer
	designer <- mtkNativeDesigner ("BasicMonteCarlo", 
		information=list(size=20))

##	Specify the model simulator
	model <- mtkIshigamiEvaluator()
	
##	Specify the sensiticity analyser
	analyser <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

##	Specify the workflow
	ishiReg <- new("mtkExpWorkflow", expFactors=Ishigami.factors,
		   processesVector=c(
				              design=designer,
				              evaluate=model,
				              analyze=analyser)
			  				)
## Run and report the results
	run(ishiReg)
	summary(ishiReg)




