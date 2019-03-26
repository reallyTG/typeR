library(mtk)


### Name: is.ready-methods
### Title: The 'is.ready' method
### Aliases: is.ready-methods is.ready

### ** Examples


## This method is usually used only for the package's core programming!!!

# creates an experimental design with the method "Morris"
# to analyze the model "Ishigami":

# Specify the factors to analyze:

	x1 <- make.mtkFactor(name="x1", distribName="unif",
	 distribPara=list(min=-pi, max=pi)) 
	x2 <- make.mtkFactor(name="x2", distribName="unif",
     distribPara=list(min=-pi, max=pi)) 
	x3 <- make.mtkFactor(name="x3", distribName="unif", 
     distribPara=list(min=-pi, max=pi)) 
	
	factors <- mtkExpFactors(list(x1,x2,x3)) 
	
# Build the designer:

	exp1.designer <- mtkNativeDesigner(design="Morris", 
	      information=list(r=20,type="oat",levels=4,grid.jump=2))
	
# Test if the process is ready to run

	is.ready(exp1.designer)




