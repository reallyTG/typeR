library(mtk)


### Name: mtkExpWorkflow-class
### Title: The 'mtkExpWorkflow' class
### Aliases: mtkExpWorkflow-class
###   addProcess,mtkExpWorkflow,mtkProcess,character-method
###   deleteProcess,mtkExpWorkflow,character-method
###   setProcess,mtkExpWorkflow,mtkProcess,character-method
###   getProcess,mtkExpWorkflow,character-method
###   extractData,mtkExpWorkflow,character-method
###   reevaluate,mtkExpWorkflow,character-method
###   serializeOn,mtkExpWorkflow-method run,mtkExpWorkflow,missing-method
###   summary,mtkExpWorkflow-method print,mtkExpWorkflow-method
###   plot,mtkExpWorkflow-method report,mtkExpWorkflow-method

### ** Examples


############## 
# Example 1: Construct a workflow 
# from the factors and the processes
##############

# Specify the factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

# Define the processes
	designer <- mtkNativeDesigner("BasicMonteCarlo", 
            information=list(size=20))
	model <- mtkNativeEvaluator("Ishigami" )
	analyser <- mtkNativeAnalyser("Regression", information=list(nboot=20) )

# Build the workflow
	ishiReg <- mtkExpWorkflow( expFactors=ishi.factors,
		   processesVector=c( design=designer,
				      evaluate=model,
				      analyze=analyser)
			  				)
			  				
# Run the workflow and report the results
	run(ishiReg)
	summary(ishiReg)

############## 
######## Example 2: Construct a workflow from a XML file
##############
# # XML file is held in the directory of the library: "inst/extdata/"

# Specify the XML file's name
	xmlFile <- "WWDM_morris.xml"
## find where the examples are held.
	xmlFilePath <- paste(path.package("mtk", quiet = TRUE),
			"/extdata/",xmlFile,sep = "") 
		
# Create the workflow from the XML
	## Nota: If your XML file is local
	## file for example /var/tmp/X.xml", you should
	## create the workflow as follows: 
	## workflow <- mtkExpWorkflow(
	## xmlFilePath = "/var/tmp/X.xml"
	## )

	workflow <- mtkExpWorkflow(xmlFilePath=xmlFilePath)

# Run the workflow and report the results
	run(workflow)
	summary(workflow)




