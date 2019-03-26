library(mtk)


### Name: mtkWWDMEvaluator
### Title: The constructor of the class 'mtkWWDMEvaluator'
### Aliases: mtkWWDMEvaluator

### ** Examples


# Carry out a sensitivity analysis with the WWDM model

##	Input the factors
	data(WWDM.factors)

##	Specify the experiments designer
	designer <- mtkMorrisDesigner (
		listParameters = list(type="oat", levels=5, grid.jump=3, r=10)
		)

##	Specify the model simulator
	model <- mtkWWDMEvaluator(
		listParameters = list(year=3, tout=FALSE)
		)
	
##	Specify the sensiticity analyser
	analyser <- mtkMorrisAnalyser()

##	Specify the workflow
	exp <- new("mtkExpWorkflow", expFactors=WWDM.factors,
		   processesVector=c(
				              design=designer,
				              evaluate=model,
				              analyze=analyser)
			  				)
## Run and report the results
	run(exp)
	summary(exp)




