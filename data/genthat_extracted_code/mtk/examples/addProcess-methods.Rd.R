library(mtk)


### Name: addProcess-methods
### Title: The 'addProcess' method
### Aliases: addProcess-methods addProcess

### ** Examples


# Define the factors

	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif", 
		distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
		distribPara=list(min=-pi, max=pi))
	
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

# Create a workflow to manager the processes used for the analysis task

	ishiReg <- mtkExpWorkflow(expFactors=ishi.factors)

# Create a designer to generate the experiments design and
# put the designer under control of the workflow

	designer <- mtkNativeDesigner("BasicMonteCarlo", 
            information=list(size=20))

	addProcess(ishiReg, designer, name="design")

	# Creates an evaluator and add it to the workflow

	model <- mtkNativeEvaluator("Ishigami" )

	addProcess(ishiReg, model, name="evaluate")

# Create a analyser and add it to the workflow

	analyser <- mtkNativeAnalyser("Regression" )

	addProcess(ishiReg, analyser, name="analyze")

# Run the workflow and reports the results

	run(ishiReg)
	summary(ishiReg)



