library(mtk)


### Name: mtk.designerAddons
### Title: The 'mtk.designerAddons' function
### Aliases: mtk.designerAddons

### ** Examples

# an example implementation of the method "MC" is held  in the file
# "inst/extdata/montecarloDesigner.R"

	rFile <- "montecarloDesigner.R"
	rFile <- paste(path.package("mtk", quiet = TRUE),
			"/extdata/",rFile,sep = "")

# to convert this special version of the method "MC" 
# to S4 classes compliant with the "mtk" package. The generated "mtk" compliant class
# is called "mtkXXXDesigner.R" where XXX corresponds to the name of the method.
	mtk.designerAddons(where=rFile, authors="H. Monod,INRA", name="MC",
		 main="basicMonteCarlo")

# to use the method "MC" with the package "mtk",
# just source the generated new files

	source("mtkMCDesigner.R")

## Use the "mtkMCDesigner" with the "mtk" package in a seamless way:

#	1) Define the factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))
	
#	2) Specify a new workflow with the new method
	ishiReg <- mtkExperiment(expFactors=ishi.factors,design="MC",
			model="Ishigami", analyze="Regression",
		    designInfo=list(size=20))
		   
#	3) Run the workflow and report the results
	run(ishiReg)
	summary(ishiReg)




