library(mtk)


### Name: run-methods
### Title: The 'run' method
### Aliases: run-methods run

### ** Examples

# Create a designer and an analyser avec the method "Morris"
# to analyze the model "Ishigami":

# Specify the factors to analyze:
	x1 <- make.mtkFactor(name="x1", distribName="unif",
	 distribPara=list(min=-pi, max=pi)) 
	x2 <- make.mtkFactor(name="x2", distribName="unif",
     distribPara=list(min=-pi, max=pi)) 
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
     distribPara=list(min=-pi, max=pi)) 
	factors <- mtkExpFactors(list(x1,x2,x3)) 

# Build the processes:
#   1) the experimental design process with the method "Morris".
		exp1.designer <- mtkNativeDesigner(design="Morris", 
	      information=list(r=20,type="oat",levels=4,grid.jump=2)) 

#   2) the model simulation process with the model "Ishigami".
		exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   #   3) the analysis process with the default method.
#      Here, it is the Morris method.
		exp1.analyser <- mtkDefaultAnalyser()

# Build the  workflow with the processes defined previously.
		exp1 <- mtkExpWorkflow(expFactors=factors,
	   	 processesVector = c(design=exp1.designer,
			evaluate=exp1.evaluator, analyze=exp1.analyser))
# Run the workflow and plot the results.
		run(exp1)
		print(exp1)



