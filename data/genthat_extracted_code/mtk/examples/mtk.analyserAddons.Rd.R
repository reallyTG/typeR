library(mtk)


### Name: mtk.analyserAddons
### Title: The 'mtk.analyserAddons' function
### Aliases: mtk.analyserAddons

### ** Examples

# an example implementation of the method "Regression" 
# called here "RegressionTest" is held  in the file
#  "inst/extdata/regressionSI.R"

rFile <- "regressionSI.R"
rFile <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",rFile,sep = "")


# to convert the method "RegressionTest" to S4 classes
# compliant with the "mtk" package. The generated "mtk" compliant class
# is called "mtkXXXAnalyser.R" where XXX corresponds to the name of the method.

mtk.analyserAddons(where=rFile, authors="H. Monod,INRA",
		 name="RegressionTest",
  		main="regressionSI", print="print.regressionSI",
  	    plot="plot.regressionSI")

# To use the method "RegressionTest" with the package "mtk",
# just source the generated new files

source("mtkRegressionTestAnalyser.R")

## Use the method "RegressionTest" to do sensitivity analysis

#	1) Define the factors
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	x2 <- make.mtkFactor(name="x2", distribName="unif",
    	 distribPara=list(min=-pi, max=pi))
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
    	 distribPara=list(min=-pi, max=pi))
	ishi.factors <- mtkExpFactors(list(x1,x2,x3))

# 	2) Create a workflow with the "Ishigami" model and analyze it with the new method
	ishiReg <- mtkExperiment(expFactors=ishi.factors,
			design="BasicMonteCarlo",designInfo=list(size=20),
			model="Ishigami", 
			analyze="RegressionTest", 
			)
# 	3) Run the workflow and report the results			
	run(ishiReg)
	summary(ishiReg)



