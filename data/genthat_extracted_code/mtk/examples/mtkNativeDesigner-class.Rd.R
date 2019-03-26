library(mtk)


### Name: mtkNativeDesigner-class
### Title: The 'mtkNativeDesigner' class
### Aliases: mtkNativeDesigner-class is.ready,mtkNativeDesigner-method
###   setReady,mtkNativeDesigner,logical-method
###   is.finished,mtkNativeDesigner-method
###   setState,mtkNativeDesigner,logical-method
###   setName,mtkNativeDesigner,character-method
###   setParameters,mtkNativeDesigner,vector-method
###   getParameters,mtkNativeDesigner-method
###   getResult,mtkNativeDesigner-method getData,mtkNativeDesigner-method
###   serializeOn,mtkNativeDesigner-method
###   run,mtkNativeDesigner,mtkExpWorkflow-method
###   summary,mtkNativeDesigner-method print,mtkNativeDesigner-method
###   plot,mtkNativeDesigner-method report,mtkNativeDesigner-method

### ** Examples

# Create a native designer with the method "Morris"
# implemented in the package "mtk"

designer <- mtkNativeDesigner(
	design ="Morris", 
	information=list(size=20)
	)



