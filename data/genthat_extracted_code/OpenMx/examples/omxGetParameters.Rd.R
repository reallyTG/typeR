library(OpenMx)


### Name: omxGetParameters
### Title: Fetch Model Parameters
### Aliases: omxGetParameters

### ** Examples


library(OpenMx)

A <- mxMatrix('Full', 2, 2, labels = c("A11", "A12", "A21", NA), values= 1:4, 
    free = c(TRUE,TRUE,FALSE,TRUE), byrow=TRUE, name = 'A')
model <- mxModel(A, name = 'model')

# Request all free parameters in model
omxGetParameters(model)

# A11  A12 model.A[2,2] 
#   1    2    4 

# Request fixed parameters from model
omxGetParameters(model, free = FALSE)
# A21 
#   3

A$labels
#      [,1]  [,2] 
# [1,] "A11" "A12"
# [2,] "A21" NA   

A$free
#       [,1] [,2]
# [1,]  TRUE TRUE
# [2,] FALSE TRUE

A$values
#      [,1] [,2]
# [1,]    1    2
# [2,]    3    4

# Example using un-labelled parameters

# Read in some demo data
data(demoOneFactor)
# Grab the names for manifestVars 
manifestVars <- names(demoOneFactor)
nVar = length(manifestVars) # 5 variables
factorModel <- mxModel("One Factor",
    mxMatrix(name="A", type="Full", nrow=nVar, ncol=1, values=0.2, free=TRUE, 
        lbound = 0.0, labels=letters[1:nVar]),
    mxMatrix(name="L", type="Symm", nrow=1, ncol=1, values=1, free=FALSE),
    # the "U" matrix has nVar (5) anonymous free parameters
    mxMatrix(name="U", type="Diag", nrow=nVar, ncol=nVar, values=1, free=TRUE),
    mxAlgebra(expression=A %&% L + U, name="R"),
    mxExpectationNormal(covariance="R", dimnames=manifestVars),
    mxFitFunctionML(),
    mxData(observed=cov(demoOneFactor), type="cov", numObs=500)
)

# Get all free parameters
params         <- omxGetParameters(factorModel)
lbound         <- omxGetParameters(factorModel, fetch="lbound")
# Set new values for these params, saving them in a new model
newFactorModel <- omxSetParameters(factorModel, names(params), values = 1:10)
# Read out the values from the new model
newParams      <- omxGetParameters(newFactorModel)




