library(mtk)


### Name: Morris
### Title: The 'Morris' method
### Aliases: Morris

### ** Examples


## Sensitivity analysis of the "Ishigami" model with the "Morris" method 

#	Example I: by using the class constructors: mtkMorrisDesigner() and mtkMorrisAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkMorrisDesigner( 
					listParameters = list(r=20, type="oat",
					   				levels=4, grid.jump=2)
							) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process 
		exp1.analyser <- mtkMorrisAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	            processesVector = c(design=exp1.designer,	
	    				 		    evaluate=exp1.evaluator, 
	    						    analyze=exp1.analyser)
	    					    )

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)
		plot(exp1)
#       plot3d.morris(extractData(exp1, name="analyze"))
    
## 	Example II:  by using the class constructors: mtkNativeDesigner() and mtkMorrisAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkNativeDesigner(design = "Morris", 
	    	  information = list(r=20, type="oat",
	    	  				levels=4, grid.jump=2)
	    	  				 ) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process with the default method
		exp1.analyser <- mtkMorrisAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer, 
	    					evaluate=exp1.evaluator, 
	    					analyze=exp1.analyser)
	    				  )

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)
		

## 	Example III:  by using the class constructors: mtkMorrisDesigner() and mtkDefaultAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkMorrisDesigner( listParameters = 
						list(r=20, type="oat", 
						levels=4, grid.jump=2))  

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process with the default method
		exp1.analyser <- mtkDefaultAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer,	
	    					evaluate=exp1.evaluator, 
	    					analyze=exp1.analyser))

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)



