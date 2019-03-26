library(OpenMx)


### Name: mxComputeGradientDescent
### Title: Optimize parameters using a gradient descent optimizer
### Aliases: mxComputeGradientDescent MxComputeGradientDescent-class

### ** Examples

data(demoOneFactor)
factorModel <- mxModel(name ="One Factor",
  mxMatrix(type="Full", nrow=5, ncol=1, free=FALSE, values=0.2, name="A"),
    mxMatrix(type="Symm", nrow=1, ncol=1, free=FALSE, values=1, name="L"),
    mxMatrix(type="Diag", nrow=5, ncol=5, free=TRUE, values=1, name="U"),
    mxAlgebra(expression=A %*% L %*% t(A) + U, name="R"),
  mxExpectationNormal(covariance="R", dimnames=names(demoOneFactor)),
  mxFitFunctionML(),
    mxData(observed=cov(demoOneFactor), type="cov", numObs=500),
     mxComputeSequence(steps=list(
     mxComputeGradientDescent(),
     mxComputeNumericDeriv(),
     mxComputeStandardError(),
     mxComputeHessianQuality()
    )))
factorModelFit <- mxRun(factorModel)
factorModelFit$output$conditionNumber # 29.5



