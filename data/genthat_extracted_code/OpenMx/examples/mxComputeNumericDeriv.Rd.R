library(OpenMx)


### Name: mxComputeNumericDeriv
### Title: Numerically estimate Hessian using Richardson extrapolation
### Aliases: mxComputeNumericDeriv MxComputeNumericDeriv-class

### ** Examples

library(OpenMx)
data(demoOneFactor)
factorModel <- mxModel(name ="One Factor",
	mxMatrix(type = "Full", nrow = 5, ncol = 1, free = FALSE, values = .2, name = "A"), 
	mxMatrix(type = "Symm", nrow = 1, ncol = 1, free = FALSE, values = 1 , name = "L"), 
	mxMatrix(type = "Diag", nrow = 5, ncol = 5, free = TRUE , values = 1 , name = "U"), 
	mxAlgebra(A %*% L %*% t(A) + U, name = "R"),
	mxExpectationNormal(covariance = "R", dimnames = names(demoOneFactor)), 
	mxFitFunctionML(), 
	mxData(cov(demoOneFactor), type = "cov", numObs = 500), 
	mxComputeSequence(
		list(mxComputeNumericDeriv(), mxComputeReportDeriv())
	)
)
factorModelFit <- mxRun(factorModel)
factorModelFit$output$hessian



