library(mtk)


### Name: is.finished-methods
### Title: The 'is.finished' method
### Aliases: is.finished-methods is.finished

### ** Examples


# Build a workflow to do the sensitivity analysis for the model "Ishigami"
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
     	distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))


	designer <- mtkNativeDesigner("BasicMonteCarlo", 
            information=list(size=20))
	
	ishiReg <- mtkExpWorkflow(expFactors=ishi.factors,
		   processesVector=c(design=designer)
		   )
	run(ishiReg)

# Extract the process "design" and test if it is correctly executed.

	designer <- getProcess(ishiReg, "design")
	is.finished(designer)



