library(mtk)


### Name: Ishigami
### Title: The 'Ishigami' model
### Aliases: Ishigami

### ** Examples


### Run simulations of the "Ishigami" model
### for a random sample of input combinations

## Example I: by using the class constructor: mtkIshigamiEvaluator()

# 
# Input the factors used in the "Ishigami" model
	data(Ishigami.factors)

# Build the workflow:
#   1) specify the design process
	exp1.designer <- mtkNativeDesigner(design = "BasicMonteCarlo",
					 information = list(size=20) ) 

#   2) specify the evaluation process; 
	exp1.evaluator <- mtkIshigamiEvaluator() 

#   3) specify the workflow
	exp1 <- mtkExpWorkflow(expFactors = Ishigami.factors,
	               processesVector = c(design=exp1.designer,
	               evaluate=exp1.evaluator) )
# Run the workflow and report the results.
	run(exp1)
	print(exp1)
	
## Example II: by using the class constructor: mtkNativeEvaluator()

# Generate the Ishigami input factors
	data(Ishigami.factors)

# Build the workflow:
#   1) specify the design process
	exp1.designer <- mtkNativeDesigner(design = "BasicMonteCarlo", 
					information = list(size=20) ) 

#   2) specify the evaluation process; 
	exp1.evaluator <- mtkNativeEvaluator(model="Ishigami") 

#   3) specify the workflow
	exp1 <- mtkExpWorkflow(expFactors = Ishigami.factors,
	               processesVector = c(design=exp1.designer, evaluate=exp1.evaluator) )
                 
# Run the workflow and report the results.
	run(exp1)
	print(exp1)
	
## Example III: by using the generic class constructor: mtkEvaluator()

# Generate the Ishigami input factors
	data(Ishigami.factors)

# Build the workflow:
#   1) specify the design process
	exp1.designer <- mtkNativeDesigner(
					design = "BasicMonteCarlo", information = list(size=20) ) 

#   2) specify the evaluation process; 
	exp1.evaluator <- mtkEvaluator(protocol = "R", site = "mtk", service = "Ishigami")

#   3) specify the workflow
	exp1 <- mtkExpWorkflow(expFactors = Ishigami.factors,
	               processesVector = c(design=exp1.designer, evaluate=exp1.evaluator) )
# Run the workflow and report the results.
	run(exp1)
	print(exp1)




