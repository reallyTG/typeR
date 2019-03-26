library(mtk)


### Name: mtkAnalyser-class
### Title: The 'mtkAnalyser' class
### Aliases: mtkAnalyser-class is.ready,mtkAnalyser-method
###   setReady,mtkAnalyser,logical-method is.finished,mtkAnalyser-method
###   setState,mtkAnalyser,logical-method
###   setName,mtkAnalyser,character-method
###   setParameters,mtkAnalyser,vector-method
###   getParameters,mtkAnalyser-method getResult,mtkAnalyser-method
###   getData,mtkAnalyser-method serializeOn,mtkAnalyser-method
###   run,mtkAnalyser,mtkExpWorkflow-method summary,mtkAnalyser-method
###   print,mtkAnalyser-method plot,mtkAnalyser-method
###   report,mtkAnalyser-method

### ** Examples



# Creates an analyser avec the method "Morris" 
# implemented in the package "mtk".
	
	analyser <- mtkAnalyser(service="Morris",
		 parametersList=list(nboot=20))



