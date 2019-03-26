library(mtk)


### Name: mtk-package
### Title: MTK (Mexico ToolKit) for Sensitivity Analysis and Numerical
###   Experiments
### Aliases: mtk-package

### ** Examples


### Example 1: Sensitivity analysis of the "Ishigami" model ###

# Specify the factors to analyze:
	x1 <- make.mtkFactor(name="x1", 
	   distribName="unif", distribPara=list(min=-pi, max=pi)) 
	x2 <- make.mtkFactor(name="x2", distribName="unif", 
	   distribPara=list(min=-pi, max=pi)) 
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
	   distribPara=list(min=-pi, max=pi)) 
	factors <- mtkExpFactors(list(x1,x2,x3)) 
# Build the processes:
#  1) the experimental design process with the method "Morris".
	exp1.Designer <- mtkMorrisDesigner(listParameters
			= list(r=20,type="oat",levels=4,grid.jump=2)) 

#  2) the model simulation process with the model "Ishigami".
	exp1.Evaluator <- mtkIshigamiEvaluator() 

#  3) the analysis process with the method "Morris".
	exp1.Analyser <- mtkMorrisAnalyser()

# Build the  workflow with the processes defined previously.
	exp1 <- mtkExpWorkflow(expFactors=factors, 
	 	   processesVector = c(
	    	design=exp1.Designer,
			evaluate=exp1.Evaluator, 
			analyze=exp1.Analyser)
			) 
		
# Run the workflow and reports the results.
	run(exp1)
	print(exp1)
	
# Create a new process with the analysis method «Regression». 
	exp1.AnalyserReg <- mtkRegressionAnalyser(listParameters
			=list(nboot=20)
		 )
	
# Re-analyze the model "Ishigami" with the method "Regression":
## replace the process, run the workflow and  report the results

	setProcess(exp1, exp1.AnalyserReg, "analyze")	
	run(exp1) 
	print(exp1)

### Example 2 : Sensitivity analysis from a XML file  ###

# # XML file is held in the directory of the library: "inst/extdata/"

# Specify the XML file's name
	xmlFile <- "WWDM_morris.xml"

## Find where the examples are held.
	xmlFilePath <- paste(path.package("mtk", quiet = TRUE),
			"/extdata/",xmlFile,sep = "") 
		
# Create the workflow
## 	Nota: If your XML file is local file for example "/var/tmp/X.xml",
## 	you should create the workflow as follows: 
## 	workflow <- mtkExpWorkflow(xmlFilePath="/var/tmp/X.xml")

	workflow <- mtkExpWorkflow(xmlFilePath=xmlFilePath)

# Run the workflow and report the results
	run(workflow)
	summary(workflow)




