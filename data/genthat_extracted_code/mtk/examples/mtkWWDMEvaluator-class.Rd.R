library(mtk)


### Name: mtkWWDMEvaluator-class
### Title: The 'mtkWWDMEvaluator' class
### Aliases: mtkWWDMEvaluator-class is.ready,mtkWWDMEvaluator-method
###   setReady,mtkWWDMEvaluator,logical-method
###   is.finished,mtkWWDMEvaluator-method
###   setState,mtkWWDMEvaluator,logical-method
###   setName,mtkWWDMEvaluator,character-method
###   setParameters,mtkWWDMEvaluator,vector-method
###   getParameters,mtkWWDMEvaluator-method
###   getResult,mtkWWDMEvaluator-method getData,mtkWWDMEvaluator-method
###   serializeOn,mtkWWDMEvaluator-method
###   run,mtkWWDMEvaluator,mtkExpWorkflow-method
###   summary,mtkWWDMEvaluator-method print,mtkWWDMEvaluator-method
###   plot,mtkWWDMEvaluator-method report,mtkWWDMEvaluator-method

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
		listParameters = list(year=3)
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




