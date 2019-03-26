library(mtk)


### Name: Regression
### Title: The 'Regression' Method
### Aliases: Regression

### ** Examples

# Uses the method "Regression" to analyze the model "Ishigami":

#  Generate the factors
    data(Ishigami.factors)

# Builds experiment design with the Monte-Carlo method
	  designer <- mtkBasicMonteCarloDesigner( listParameters=list(size=20) )

# Builds a simulator for the model "Ishigami" with the defined factors
	  model <- mtkNativeEvaluator("Ishigami" )

# Builds an analyser with the method "Regression" implemented in the package "mtk"
	  analyser <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

# Builds a workflow to manage the processes scheduling.
	  ishiReg <- mtkExpWorkflow( expFactors=Ishigami.factors,
		   processesVector=c(design=designer, evaluate=model, analyze=analyser) )

# Runs the workflow et reports the results
	  run(ishiReg)
	  summary(ishiReg)
    plot(ishiReg)



