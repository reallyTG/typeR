library(mtk)


### Name: setProcess-methods
### Title: The 'setProcess' method
### Aliases: setProcess-methods setProcess

### ** Examples

# Analyze the "Ishigami" model with the "Regression" method

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

# Re-analyzes the model "Ishigami" with the method "Morris"

#	1) Build a designer with the method "Morris" and put it into the workflow
	morris.designer <- mtkNativeDesigner(
		design="Morris", 
		information=list(r=20,type="oat",levels=4,grid.jump=2)
		) 
	setProcess(ishiReg, morris.designer, "design")
	
#	2) Build an analysis process with the default method and put it
#     into the workflow
		default.analyser <- mtkDefaultAnalyser()
		setProcess(ishiReg, default.analyser, "analyze")
#	3) Run the new workflow

	run(ishiReg)
	summary(ishiReg)



