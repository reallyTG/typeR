library(mtk)


### Name: mtkMorrisDesigner-class
### Title: The 'mtkMorrisDesigner' class
### Aliases: mtkMorrisDesigner-class is.ready,mtkMorrisDesigner-method
###   setReady,mtkMorrisDesigner,logical-method
###   is.finished,mtkMorrisDesigner-method
###   setState,mtkMorrisDesigner,logical-method
###   setName,mtkMorrisDesigner,character-method
###   setParameters,mtkMorrisDesigner,vector-method
###   getParameters,mtkMorrisDesigner-method
###   getResult,mtkMorrisDesigner-method getData,mtkMorrisDesigner-method
###   serializeOn,mtkMorrisDesigner-method
###   run,mtkMorrisDesigner,mtkExpWorkflow-method
###   summary,mtkMorrisDesigner-method print,mtkMorrisDesigner-method
###   plot,mtkMorrisDesigner-method report,mtkMorrisDesigner-method

### ** Examples


## Sensitivity analysis of the "Ishigami" model with the "Morris" method 


#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkMorrisDesigner( listParameters
	    	= list(r=20, type="oat", levels=4, grid.jump=2)) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process 
		exp1.analyser <- mtkMorrisAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer,
		evaluate=exp1.evaluator, analyze=exp1.analyser))

# 	Run the workflow and report the results.
		run(exp1)
		print(exp1)
		



