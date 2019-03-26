library(mtk)


### Name: mtkRegressionAnalyser-class
### Title: The 'mtkRegressionAnalyser' class
### Aliases: mtkRegressionAnalyser-class
###   is.ready,mtkRegressionAnalyser-method
###   setReady,mtkRegressionAnalyser,logical-method
###   is.finished,mtkRegressionAnalyser-method
###   setState,mtkRegressionAnalyser,logical-method
###   setName,mtkRegressionAnalyser,character-method
###   setParameters,mtkRegressionAnalyser,vector-method
###   getParameters,mtkRegressionAnalyser-method
###   getResult,mtkRegressionAnalyser-method
###   getData,mtkRegressionAnalyser-method
###   serializeOn,mtkRegressionAnalyser-method
###   run,mtkRegressionAnalyser,mtkExpWorkflow-method
###   summary,mtkRegressionAnalyser-method
###   print,mtkRegressionAnalyser-method plot,mtkRegressionAnalyser-method
###   report,mtkRegressionAnalyser-method

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
	



