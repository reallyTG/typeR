library(mtk)


### Name: mtkEvaluator
### Title: The constructor of the class 'mtkEvaluator'
### Aliases: mtkEvaluator

### ** Examples

# Create an evaluator with the model "Ishigami" implemented in the package "mtk".
 
 	evaluator1 <- mtkEvaluator(service="Ishigami")
 
# Create an evaluator avec the model "WWDM"  implemented in the package "mtk"
 	evaluator2 <- mtkEvaluator(service="WWDM", 
 			parametersList=list(year=3, tout=FALSE))



