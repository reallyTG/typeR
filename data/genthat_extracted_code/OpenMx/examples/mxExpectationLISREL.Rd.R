library(OpenMx)


### Name: mxExpectationLISREL
### Title: Create MxExpectationLISREL Object
### Aliases: mxExpectationLISREL MxExpectationLISREL-class
###   show,MxExpectationLISREL-method print,MxExpectationLISREL-method

### ** Examples

   
# Create and fit a model using mxExpectationLISREL, and mxFitFunctionML

library(OpenMx)

vNames <- paste("v",as.character(1:6),sep="")
dimList <- list(vNames, vNames)
covData <- matrix(
  c(0.9223099, 0.1862938, 0.4374359, 0.8959973, 0.9928430, 0.5320662,
    0.1862938, 0.2889364, 0.3927790, 0.3321639, 0.3371594, 0.4476898,
    0.4374359, 0.3927790, 1.0069552, 0.6918755, 0.7482155, 0.9013952,
    0.8959973, 0.3321639, 0.6918755, 1.8059956, 1.6142005, 0.8040448,
    0.9928430, 0.3371594, 0.7482155, 1.6142005, 1.9223567, 0.8777786,
    0.5320662, 0.4476898, 0.9013952, 0.8040448, 0.8777786, 1.3997558
    ), nrow=6, ncol=6, byrow=TRUE, dimnames=dimList)

# Create LISREL matrices

mLX <- mxMatrix("Full", values=c(.5, .6, .8, rep(0, 6), .4, .7, .5),
          name="LX", nrow=6, ncol=2,
          free=c(TRUE,TRUE,TRUE,rep(FALSE, 6),TRUE,TRUE,TRUE),
          dimnames=list(vNames, c("x1","x2")))
mTD <- mxMatrix("Diag", values=c(rep(.2, 6)), 
          name="TD", nrow=6, ncol=6, free=TRUE,
          dimnames=dimList)
mPH <- mxMatrix("Symm", values=c(1, .3, 1), 
          name="PH", nrow=2, ncol=2, free=c(FALSE, TRUE, FALSE),
          dimnames=list(c("x1","x2"),c("x1","x2")))

# Create a LISREL expectation with LX, TD, and PH matrix names

expFunction <- mxExpectationLISREL(LX="LX", TD="TD", PH="PH")

# Create fit function and data

tmpData <- mxData(observed=covData, type="cov", numObs=100)
fitFunction <- mxFitFunctionML()

# Create the model, fit it, and print a summary.

tmpModel <- mxModel(model="exampleModel",
                    mLX, mTD, mPH, expFunction, fitFunction, tmpData)
tmpModelOut <- mxRun(tmpModel)
summary(tmpModelOut)


#--------------------------------------
# Fit factor model with means

require(OpenMx)

data(demoOneFactor)
nvar <- ncol(demoOneFactor)
varnames <- colnames(demoOneFactor)

factorMeans <- mxMatrix("Zero", 1, 1, name="Kappa",
                        dimnames=list("F1", NA))
xIntercepts <- mxMatrix("Full", nvar, 1, free=TRUE, name="TauX",
                        dimnames=list(varnames, NA))
factorLoadings <- mxMatrix("Full", nvar, 1, TRUE, .6, name="LambdaX",
                           labels=paste("lambda", 1:nvar, sep=""),
                           dimnames=list(varnames, "F1"))
factorCovariance <- mxMatrix("Diag", 1, 1, FALSE, 1, name="Phi")
xResidualVariance <- mxMatrix("Diag", nvar, nvar, TRUE, .2, name="ThetaDelta",
                              labels=paste("theta", 1:nvar, sep=""))

liModel <- mxModel(model="LISREL Factor Model",
	factorMeans, xIntercepts, factorLoadings,
	factorCovariance, xResidualVariance,
	mxExpectationLISREL(LX="LambdaX", PH="Phi",
		TD="ThetaDelta", TX="TauX", KA="Kappa"),
	mxFitFunctionML(),
	mxData(cov(demoOneFactor), "cov",
		means=colMeans(demoOneFactor), numObs=nrow(demoOneFactor))
)

liRun <- mxRun(liModel)

summary(liRun)



