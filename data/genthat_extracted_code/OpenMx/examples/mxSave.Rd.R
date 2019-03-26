library(OpenMx)


### Name: mxSave
### Title: Save End State to Checkpoint File
### Aliases: mxSave

### ** Examples


library(OpenMx)

# Simulate some data

x=rnorm(1000, mean=0, sd=1)
y= 0.5*x + rnorm(1000, mean=0, sd=1)
tmpFrame <- data.frame(x, y)
tmpNames <- names(tmpFrame)

# Create a model that includes an expected covariance matrix,
# an expectation function, a fit function, and an observed covariance matrix

data <- mxData(cov(tmpFrame), type="cov", numObs = 1000)
expCov <- mxMatrix(type="Symm", nrow=2, ncol=2, values=c(.2,.1,.2), free=TRUE, name="expCov")
expFunction <- mxExpectationNormal(covariance="expCov", dimnames=tmpNames)
fitFunction <- mxFitFunctionML()
testModel <- mxModel(model="testModel", expCov, data, expFunction, fitFunction)

#Use mxRun to optimize the free parameters in the expected covariance matrix
modelOut <- mxRun(testModel)
modelOut$expCov

# Save the ending state of modelOut in a checkpoint file
mxSave(modelOut)

# Restore the saved model from the checkpoint file
modelSaved <- mxRestore(testModel)
modelSaved$expCov

# Imagine how much time you saved by not having to re-run the
# model that took hours or days to run.



