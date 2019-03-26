library(OpenMx)


### Name: mxModelAverage
### Title: Information-Theoretic Model-Averaging and Multimodel Inference
### Aliases: mxModelAverage omxAkaikeWeights omxAICWeights

### ** Examples

require(OpenMx)
data(demoOneFactor)
factorModel1 <- mxModel(
	"OneFactor1",
	mxMatrix(
		"Full", 5, 1, values=0.8, 
		labels=paste("a",1:5,sep=""),
		free=TRUE, name="A"),
	mxMatrix(
		"Full", 5, 1, values=1,
		labels=paste("u",1:5,sep=""),
		free=TRUE, name="Udiag"),
	mxMatrix(
		"Symm", 1, 1, values=1,
		free=FALSE, name="L"),
	mxAlgebra(vec2diag(Udiag),name="U"),
	mxAlgebra(A %*% L %*% t(A) + U, name="R"),
	mxExpectationNormal(
		covariance = "R",
		dimnames = names(demoOneFactor)),
	mxFitFunctionML(),
	mxData(cov(demoOneFactor), type="cov", numObs=500))
factorFit1 <- mxRun(factorModel1)
#Constrain unique variances equal:
factorModel2 <- omxSetParameters(
	model=factorModel1,labels=paste("u",1:5,sep=""),
	newlabels="u",name="OneFactor2")
factorFit2 <- mxRun(factorModel2)
omxAkaikeWeights(models=list(factorFit1,factorFit2))
## Not run: 
##D mxModelAverage(
##D 	reference=c("A","Udiag"), include="all",
##D 	models=list(factorFit1,factorFit2))
## End(Not run)



