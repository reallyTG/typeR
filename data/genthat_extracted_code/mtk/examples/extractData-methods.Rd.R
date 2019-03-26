library(mtk)


### Name: extractData-methods
### Title: The 'extractData' method
### Aliases: extractData-methods extractData

### ** Examples


# Build a workflow for sensitivity analysis with the model "Ishigami"

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

	ishiReg <- mtkExpWorkflow(expFactors=ishi.factors,
		   processesVector=c(design = designer,
				      evaluate = model,
				      analyze = analyser)
			  				)
	run(ishiReg)

	# extracts the results produced by the workflow as a data.frame:

	design <- extractData(ishiReg, "design")
	simulation <-  extractData(ishiReg, c("design", "evaluate"))



