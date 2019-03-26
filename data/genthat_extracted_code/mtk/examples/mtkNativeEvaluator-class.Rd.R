library(mtk)


### Name: mtkNativeEvaluator-class
### Title: The 'mtkNativeEvaluator' class
### Aliases: mtkNativeEvaluator-class is.ready,mtkNativeEvaluator-method
###   setReady,mtkNativeEvaluator,logical-method
###   is.finished,mtkNativeEvaluator-method
###   setState,mtkNativeEvaluator,logical-method
###   setName,mtkNativeEvaluator,character-method
###   setParameters,mtkNativeEvaluator,vector-method
###   getParameters,mtkNativeEvaluator-method
###   getResult,mtkNativeEvaluator-method getData,mtkNativeEvaluator-method
###   serializeOn,mtkNativeEvaluator-method
###   run,mtkNativeEvaluator,mtkExpWorkflow-method
###   summary,mtkNativeEvaluator-method print,mtkNativeEvaluator-method
###   plot,mtkNativeEvaluator-method report,mtkNativeEvaluator-method

### ** Examples

## 1) Create a model simulation  with the model "Ishigami" implemented in the package "mtk"
	
	evaluator <- mtkNativeEvaluator(model="Ishigami")
	
## 2) Create a model simulation  with a R function implemented outside the package "mtk"

#	a) Create a R function to represent the model of population

	ME <- function(K, Y0, a, t=5, ...){
	
	res <- exp(-a*t)
	res <- Y0+res*(K-Y0)
	res <- K*Y0/res
	out <- as.integer(res)
	
	return(out)	
	}
#	b) Do the sensitivity analysis for the function "ME"

	K <- make.mtkFactor(name="K", nominal=400, distribName="unif",
		distribPara=list(min=100, max=1000))
	Y0 <- make.mtkFactor(name="Y0", nominal=20, distribName="unif",
		distribPara=list(min=1, max=40))
	a <- make.mtkFactor(name="a", nominal=0.1, distribName="unif", 
		distribPara=list(min=0.05, max=0.2))
	factors <- mtkExpFactors(list(K,Y0,a))


	plan <- mtkNativeDesigner ("BasicMonteCarlo", 
		information=c(size=500))

	model <- mtkNativeEvaluator(model=ME, information=c(t=5))

	index<- mtkNativeAnalyser("Regression", information=c(nboot=20) )

	expt <- mtkExpWorkflow( expFactors=factors,
		processesVector=c(
				design= plan,
				evaluate= model,
				analyze= index)
		)
	run(expt)
	summary(expt)
	
##	3) Import the results of model simulation produced off-line 
##	   into an object of mtkNativeEvaluator

	data <- data.frame()
	model <- mtkNativeEvaluator(Y=data, 
		information = list(model="Ishigami"))



