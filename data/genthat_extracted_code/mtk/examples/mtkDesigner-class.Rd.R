library(mtk)


### Name: mtkDesigner-class
### Title: The 'mtkDesigner' class
### Aliases: mtkDesigner-class is.ready,mtkDesigner-method
###   setReady,mtkDesigner,logical-method is.finished,mtkDesigner-method
###   setState,mtkDesigner,logical-method
###   setName,mtkDesigner,character-method
###   setParameters,mtkDesigner,vector-method
###   getParameters,mtkDesigner-method getResult,mtkDesigner-method
###   getData,mtkDesigner-method serializeOn,mtkDesigner-method
###   run,mtkDesigner,mtkExpWorkflow-method summary,mtkDesigner-method
###   print,mtkDesigner-method plot,mtkDesigner-method
###   report,mtkDesigner-method

### ** Examples

# Create a designer with the method "Morris" 
# implemented in the package "mtk"
	designer <- mtkDesigner(service="Morris",
		 parametersList=list(nboot=20))



