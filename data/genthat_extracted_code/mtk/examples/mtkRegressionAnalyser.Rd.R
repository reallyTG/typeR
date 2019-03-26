library(mtk)


### Name: mtkRegressionAnalyser
### Title: The constructor of the class 'mtkRegressionAnalyser'
### Aliases: mtkRegressionAnalyser

### ** Examples


## Sensitivity analysis of the "Ishigami" model with the "Monte-Carlo" and "Regression" methods


#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp.designer <- mtkBasicMonteCarloDesigner (listParameters=list(size=20))

#   2) the simulation process
		exp.evaluator <- mtkIshigamiEvaluator() 

#   3) the analysis process 
		exp.analyser <- mtkRegressionAnalyser(listParameters=list(nboot=20) )

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp.designer,
		evaluate=exp.evaluator, analyze=exp.analyser))

# 	Run the workflow and report the results.
		run(exp1)
		print(exp1)
	



