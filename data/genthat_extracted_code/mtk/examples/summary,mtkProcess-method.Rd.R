library(mtk)


### Name: summary,mtkProcess-method
### Title: The 'summary' method
### Aliases: summary,mtkProcess-method summary

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
## Run and report a summary of the results produced by the workflow
	run(ishiReg)
	summary(ishiReg)




