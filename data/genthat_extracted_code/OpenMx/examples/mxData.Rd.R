library(OpenMx)


### Name: mxData
### Title: Create MxData Object
### Aliases: mxData

### ** Examples
  
    
library(OpenMx)

# Create a covariance matrix
covMatrix <- matrix( c(0.77642931, 0.39590663, 
    0.39590663, 0.49115615), 
    nrow = 2, ncol = 2, byrow = TRUE)
covNames <- c("x", "y")
dimList <- list(covNames, covNames)
dimnames(covMatrix) <- dimList

# Create an MxData object including that covariance matrix
testData <- mxData(observed=covMatrix, type="cov", numObs = 100)

testModel <- mxModel(model="testModel",
                mxMatrix(type="Symm", nrow=2, ncol=2, values=c(.2,.1,.2), 
                         free=TRUE, name="expCov", dimnames=dimList),
                mxExpectationNormal(covariance="expCov", dimnames=covNames),
                mxFitFunctionML(),
                testData) 

outModel <- mxRun(testModel)

summary(outModel)




