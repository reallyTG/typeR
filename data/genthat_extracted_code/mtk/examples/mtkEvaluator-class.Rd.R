library(mtk)


### Name: mtkEvaluator-class
### Title: The 'mtkEvaluator' class
### Aliases: mtkEvaluator-class is.ready,mtkEvaluator-method
###   setReady,mtkEvaluator,logical-method is.finished,mtkEvaluator-method
###   setState,mtkEvaluator,logical-method
###   setName,mtkEvaluator,character-method
###   setParameters,mtkEvaluator,vector-method
###   getParameters,mtkEvaluator-method getResult,mtkEvaluator-method
###   getData,mtkEvaluator-method serializeOn,mtkEvaluator-method
###   run,mtkEvaluator,mtkExpWorkflow-method summary,mtkEvaluator-method
###   print,mtkEvaluator-method plot,mtkEvaluator-method
###   report,mtkEvaluator-method

### ** Examples

# Create an evaluator with the model "Ishigami" 
# implemented in the package "mtk".
 	 evaluator1 <- mtkEvaluator(service="Ishigami")
 
# Create an evaluator with the model "WWDM"
# implemented in the package "mtk"
	 evaluator2 <- mtkEvaluator(service="WWDM", 
 			parametersList=list(year=3, tout=FALSE))



