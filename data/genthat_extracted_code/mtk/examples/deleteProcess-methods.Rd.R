library(mtk)


### Name: deleteProcess-methods
### Title: The 'deleteProcess' method
### Aliases: deleteProcess-methods deleteProcess

### ** Examples


# Create an analysis for the Ishigami model:

	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
   	  distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))


	designer <- mtkNativeDesigner("BasicMonteCarlo", 
            information=list(size=20))
	model <- mtkNativeEvaluator("Ishigami" )
	analyser <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

	ishiReg <- mtkExpWorkflow( expFactors=ishi.factors,
		   processesVector=c( design=designer,
				      evaluate=model,
				      analyze=analyser)
			  				)
	run(ishiReg)
	summary(ishiReg)

	# Delete the analysis process from the workflow and 
	# run only the model simulation:

	deleteProcess(ishiReg, "analyze")
	run(ishiReg)
	summary(ishiReg)




