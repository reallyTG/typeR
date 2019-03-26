library(mtk)


### Name: mtkFastAnalyser-class
### Title: The 'mtkFastAnalyser' class
### Aliases: mtkFastAnalyser-class is.ready,mtkFastAnalyser-method
###   setReady,mtkFastAnalyser,logical-method
###   is.finished,mtkFastAnalyser-method
###   setState,mtkFastAnalyser,logical-method
###   setName,mtkFastAnalyser,character-method
###   setParameters,mtkFastAnalyser,vector-method
###   getParameters,mtkFastAnalyser-method getResult,mtkFastAnalyser-method
###   getData,mtkFastAnalyser-method serializeOn,mtkFastAnalyser-method
###   run,mtkFastAnalyser,mtkExpWorkflow-method
###   summary,mtkFastAnalyser-method print,mtkFastAnalyser-method
###   plot,mtkFastAnalyser-method report,mtkFastAnalyser-method

### ** Examples


##			 Sensitivity analysis of the "Ishigami" model with the "Fast" method 

#	Input the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkFastDesigner(listParameters
	    	= list(n=1000)) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process 
		exp1.analyser <- mtkFastAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer,
		evaluate=exp1.evaluator, analyze=exp1.analyser))

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)





