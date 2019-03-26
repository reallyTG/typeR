library(OpenMx)


### Name: mxComputeOnce
### Title: Compute something once
### Aliases: mxComputeOnce MxComputeOnce-class

### ** Examples

data(demoOneFactor)
factorModel <- mxModel(name ="One Factor",
  mxMatrix(type="Full", nrow=5, ncol=1, free=TRUE, values=0.2, name="A"),
    mxMatrix(type="Symm", nrow=1, ncol=1, free=FALSE, values=1, name="L"),
    mxMatrix(type="Diag", nrow=5, ncol=5, free=TRUE, values=1, name="U"),
    mxAlgebra(expression=A %*% L %*% t(A) + U, name="R"),
    mxFitFunctionML(),mxExpectationNormal(covariance="R", dimnames=names(demoOneFactor)),
    mxData(observed=cov(demoOneFactor), type="cov", numObs=500),
    mxComputeOnce('fitfunction', 'fit'))
factorModelFit <- mxRun(factorModel)
factorModelFit$output$fit  # 972.15



