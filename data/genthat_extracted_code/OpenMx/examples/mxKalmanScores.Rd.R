library(OpenMx)


### Name: mxKalmanScores
### Title: Estimate Kalman scores and error covariance matrices
### Aliases: mxKalmanScores

### ** Examples

   
# Create and fit a model using mxMatrix, mxExpectationStateSpace, and mxFitFunctionML
require(OpenMx)
data(demoOneFactor)
# Use only first 50 rows, for speed of example
data <- demoOneFactor[1:50,]
nvar <- ncol(demoOneFactor)
varnames <- colnames(demoOneFactor)
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
    mxData(observed=data, type="raw"),
    mxExpectationStateSpace("A", "B", "C", "D", "Q", "R", "x0", "P0", "u"),
    mxFitFunctionML()
)
ssRun <- mxRun(ssModel)
summary(ssRun)
# Note the freely estimated Autoregressive parameter (A matrix)
#  is near zero as it should be for the independent rows of data
#  from the factor model.

ssScores <- mxKalmanScores(ssRun)

cor(cbind(ssScores$xPredicted[,1], ssScores$xUpdated[,1], ssScores$xSmoothed[,1]))
# Because the autoregressive dynamics are near zero, the predicted and updated scores
# correlate minimally, and the updated and smoothed latent state estimates
# are extremely close.

# The first few latent predicted scores
head(ssScores$xPredicted)

# The predicted latent score for time 10
ssScores$xPredicted[10+1,]

# The error covariance of the predicted score at time 10
ssScores$PPredicted[,,10+1]




