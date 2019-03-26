library(mtk)


### Name: mtkFastDesigner-class
### Title: The 'mtkFastDesigner' class
### Aliases: mtkFastDesigner-class is.ready,mtkFastDesigner-method
###   setReady,mtkFastDesigner,logical-method
###   is.finished,mtkFastDesigner-method
###   setState,mtkFastDesigner,logical-method
###   setName,mtkFastDesigner,character-method
###   setParameters,mtkFastDesigner,vector-method
###   getParameters,mtkFastDesigner-method getResult,mtkFastDesigner-method
###   getData,mtkFastDesigner-method serializeOn,mtkFastDesigner-method
###   run,mtkFastDesigner,mtkExpWorkflow-method
###   summary,mtkFastDesigner-method print,mtkFastDesigner-method
###   plot,mtkFastDesigner-method report,mtkFastDesigner-method

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





