library(mtk)


### Name: getData-methods
### Title: The 'getData' method
### Aliases: getData-methods getData

### ** Examples

## Example: Sensitivity analysis for the Ishigami model

# Define the factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
	 	distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
   	  distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
   	  distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

# Build the processes
	designer <- mtkNativeDesigner("BasicMonteCarlo", 
            information=list(size=20))
	model <- mtkNativeEvaluator("Ishigami" )
	analyser <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

# Build the workflow and run it
	ishiReg <- mtkExpWorkflow(expFactors=ishi.factors,
		   processesVector=c( design=designer,
				      evaluate=model,
				      analyze=analyser)
			  				)
	run(ishiReg)

# Extract as a data.frame the experiment design:
	designer <- getProcess(ishiReg, "design")
	expDesign <- getData(designer)





