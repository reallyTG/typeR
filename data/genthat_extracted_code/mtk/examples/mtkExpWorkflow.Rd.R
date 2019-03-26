library(mtk)


### Name: mtkExpWorkflow
### Title: The constructor of the class 'mtkExpWorkflow'
### Aliases: mtkExpWorkflow

### ** Examples


############## 
# Example 1: Construct a workflow 
# from the factors and the processes
##############

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
		   processesVector=c( design=designer,
				      evaluate=model,
				      analyze=analyser)
			  				)
	run(ishiReg)
	summary(ishiReg)

############## 
######## Example 2: Construct a workflow from a XML file
##############
# Create a workflow from XML file
	## Nota: If your XML file is a local file
	## for example /var/tmp/X.xml", you should
	## create the workflow as follows: 
	## workflow <- mtkExpWorkflow(
	##   xmlFilePath="/var/tmp/X.xml"
	## )


	xmlFile <- "WWDM_morris.xml"
	
	## If WWDM_morris.xml is a local file, the next line is not necessary.
	xmlFilePath <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",xmlFile,sep = "") 

	workflow <- mtkExpWorkflow(xmlFilePath=xmlFilePath)

# Run the workflow and report the results
	run(workflow)
	summary(workflow)




