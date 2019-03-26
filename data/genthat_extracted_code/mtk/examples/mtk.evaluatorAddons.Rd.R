library(mtk)


### Name: mtk.evaluatorAddons
### Title: The 'mtk.evaluatorAddons' function
### Aliases: mtk.evaluatorAddons

### ** Examples

# an example implementation of the model "WW" is held  
# in the file "inst/extdata/wwdm.R"

	rFile <- "wwdm.R"
	rFile <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",rFile,sep = "")

# to covert the model "WW" to a S4 classes compliant with the "mtk" package.
# The generated "mtk" compliant class is called "mtkXXXEvaluator.R" where XXX corresponds
# to the name of the model.

	mtk.evaluatorAddons(where=rFile, authors="H. Monod,INRA", name="WW", main="wwdm.simule")

# to use the model evaluator "WW" with the package "mtk",
# just source the generated new files
	
	source("mtkWWEvaluator.R")

## Use the "mtkWWEvaluator" with the "mtk" package in a seamless way:

# 1) Define the factors

	Eb <- make.mtkFactor(name="Eb", distribName="unif", 
    	  nominal=1.85, distribPara=list(min=0.9, max=2.8))
	Eimax <- make.mtkFactor(name="Eimax", distribName="unif",
    	  nominal=0.94, distribPara=list(min=0.9, max=0.99))
	K <- make.mtkFactor(name="K", distribName="unif", nominal=0.7, 
     	 distribPara=list(min=0.6, max=0.8))
	Lmax <- make.mtkFactor(name="Lmax", distribName="unif", nominal=7.5,
     	 distribPara=list(min=3, max=12))
	A <- make.mtkFactor(name="A", distribName="unif", nominal=0.0065,
    	  distribPara=list(min=0.0035, max=0.01))
	B <- make.mtkFactor(name="B", distribName="unif", nominal=0.00205,
     	 distribPara=list(min=0.0011, max=0.0025))
	TI <- make.mtkFactor(name="TI", distribName="unif", nominal=900,
     	 distribPara=list(min=700, max=1100))

	WW.factors <- mtkExpFactors(list(Eb,Eimax,K,Lmax,A,B,TI))

# 2) Build a workflow  for the "WW" model

	exp <- mtkExperiment(expFactors=WW.factors,
		design="Morris",designInfo=list(type="oat",
			r=10, levels=5, grid.jump=3),
		model="WW", modelInfo=list(year=3),
		analyze="Morris", analyzeInfo=list(type="oat",
			r=10, levels=5, grid.jump=3))
			
## 3) Run the workflow and reports the results

	run(exp)
	summary(exp)




