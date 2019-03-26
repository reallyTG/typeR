library(mtk)


### Name: mtkMorrisAnalyser-class
### Title: The 'mtkMorrisAnalyser' class
### Aliases: mtkMorrisAnalyser-class is.ready,mtkMorrisAnalyser-method
###   setReady,mtkMorrisAnalyser,logical-method
###   is.finished,mtkMorrisAnalyser-method
###   setState,mtkMorrisAnalyser,logical-method
###   setName,mtkMorrisAnalyser,character-method
###   setParameters,mtkMorrisAnalyser,vector-method
###   getParameters,mtkMorrisAnalyser-method
###   getResult,mtkMorrisAnalyser-method getData,mtkMorrisAnalyser-method
###   serializeOn,mtkMorrisAnalyser-method
###   run,mtkMorrisAnalyser,mtkExpWorkflow-method
###   summary,mtkMorrisAnalyser-method print,mtkMorrisAnalyser-method
###   plot,mtkMorrisAnalyser-method report,mtkMorrisAnalyser-method

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
		



