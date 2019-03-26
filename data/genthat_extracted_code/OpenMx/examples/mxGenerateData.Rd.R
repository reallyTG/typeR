library(OpenMx)


### Name: mxGenerateData
### Title: Generate data based on an MxModel object
### Aliases: mxGenerateData

### ** Examples


#----------
# Create data based on state space model.
require(OpenMx)
nvar <- 5
varnames <- paste("x", 1:nvar, sep="")
ssModel <- mxModel(model="State Space Manual Example",
    mxMatrix("Full", 1, 1, TRUE, .3, name="A"),
    mxMatrix("Zero", 1, 1, name="B"),
    mxMatrix("Full", nvar, 1, TRUE, .6, name="C", dimnames=list(varnames, "F1")),
    mxMatrix("Zero", nvar, 1, name="D"),
    mxMatrix("Diag", 1, 1, FALSE, 1, name="Q"),
    mxMatrix("Diag", nvar, nvar, TRUE, .2, name="R"),
    mxMatrix("Zero", 1, 1, name="x0"),
    mxMatrix("Diag", 1, 1, FALSE, 1, name="P0"),
    mxMatrix("Zero", 1, 1, name="u"),
    mxExpectationStateSpace("A", "B", "C", "D", "Q", "R", "x0", "P0", "u"),
    mxFitFunctionML()
)

ssData <- mxGenerateData(ssModel, 200) # 200 time points

# Add simulated data to model
ssModel <- mxModel(ssModel, mxData(ssData, 'raw'))

# Fit model to simulated data
ssRun <- mxRun(ssModel)

# Compare parameters estimated from random data to
#  their true generating values
cbind(Rand = omxGetParameters(ssRun), Gen = omxGetParameters(ssModel))
# Note the parameters should be "close" (up to sampling error)
# to the generating values


#----------
require(OpenMx)
manifests <- paste("x", 1:5, sep="")
latents <- c("G")
factorModel <- mxModel("One Factor",
      type="RAM",
      manifestVars = manifests,
      latentVars = latents,
      mxPath(from=latents, to=manifests, values=.8),
      mxPath(from=manifests, arrows=2, values=.2),
      mxPath(from=latents, arrows=2,
            free=FALSE, values=1.0),
      mxPath(from = 'one', to = manifests))

factorData <- mxGenerateData(factorModel, 100)

factorModel <- mxModel(factorModel,
                       mxData(observed=cov(factorData), type="cov",
                              numObs=nrow(factorData),
                              means = colMeans(factorData)))
factorRun <- mxRun(factorModel)
cbind(Rand=omxGetParameters(factorRun), Gen=omxGetParameters(factorModel))





