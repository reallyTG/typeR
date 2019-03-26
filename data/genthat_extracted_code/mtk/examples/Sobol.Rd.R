library(mtk)


### Name: Sobol
### Title: The 'Sobol' Method
### Aliases: Sobol

### ** Examples


## Sensitivity analysis of the "Ishigami" model with the "Sobol" method 

#	Example I: by using the class constructors: mtkSobolDesigner() and mtkSobolAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkSobolDesigner( listParameters = list(N=100)) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process 
  	exp1.analyser <- mtkSobolAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer, 
	    					evaluate=exp1.evaluator, 
	    					analyze=exp1.analyser))

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)
		plot(exp1)
    
## 	Example II:  by using the class constructors: mtkNativeDesigner() and mtkSobolAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkNativeDesigner(design = "Sobol", information = list(N=10)) 

#   2) the simulation process
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) the analysis process with the default method
		exp1.analyser <- mtkSobolAnalyser()

#   4) the workflow

		exp1 <- mtkExpWorkflow(expFactors=Ishigami.factors,
	    processesVector = c(design=exp1.designer, 
	    					evaluate=exp1.evaluator, 
	    					analyze=exp1.analyser))

# 	Run the workflow and reports the results.
		run(exp1)
		print(exp1)
    plot(exp1)
		

## 	Example III:  by using the class constructors: mtkSobolDesigner() and mtkDefaultAnalyser()

#	Generate the factors
		data(Ishigami.factors)
		
# 	Build the processes and workflow:

#   1) the design process
		exp1.designer <- mtkSobolDesigner( listParameters = list(N=10))  

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
    plot(exp1)



