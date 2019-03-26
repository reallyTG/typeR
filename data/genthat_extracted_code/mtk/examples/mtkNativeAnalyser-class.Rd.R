library(mtk)


### Name: mtkNativeAnalyser-class
### Title: The 'mtkNativeAnalyser' class
### Aliases: mtkNativeAnalyser-class is.ready,mtkNativeAnalyser-method
###   setReady,mtkNativeAnalyser,logical-method
###   is.finished,mtkNativeAnalyser-method
###   setState,mtkNativeAnalyser,logical-method
###   setName,mtkNativeAnalyser,character-method
###   setParameters,mtkNativeAnalyser,vector-method
###   getParameters,mtkNativeAnalyser-method
###   getResult,mtkNativeAnalyser-method getData,mtkNativeAnalyser-method
###   serializeOn,mtkNativeAnalyser-method
###   run,mtkNativeAnalyser,mtkExpWorkflow-method
###   summary,mtkNativeAnalyser-method print,mtkNativeAnalyser-method
###   plot,mtkNativeAnalyser-method report,mtkNativeAnalyser-method

### ** Examples

# Create a native analyser with the method "Morris" implemented in the package "mtk"

	analyser <- mtkNativeAnalyser(
		analyze="Morris",
		information=list(nboot=20))



