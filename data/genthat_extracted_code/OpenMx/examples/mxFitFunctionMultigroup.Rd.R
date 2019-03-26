library(OpenMx)


### Name: mxFitFunctionMultigroup
### Title: Create MxFitFunctionMultigroup object
### Aliases: MxFitFunctionMultigroup-class mxFitFunctionMultigroup

### ** Examples

#------------------------------------------------
# Brief non-running example
require("OpenMx")
mxFitFunctionMultigroup(c("model1", "model2")) # names of sub-models to be jointly optimised


#------------------------------------------------
# Longer, fully featured, running example
# 
# 
# Create and fit a model using mxMatrix, mxExpectationRAM, mxFitFunctionML,
# and mxFitFunctionMultigroup.
# The model is multiple group regression.
# Only the residual variances are allowed to differ across groups.


library(OpenMx)

# Simulate some data

# Group 1
N1=100
x=rnorm(N1, mean=0, sd=1)
y= 0.5*x + rnorm(N1, mean=0, sd=1)
ds1 <- data.frame(x, y)
dsNames <- names(ds1)

# Group 2
N2=150
x=rnorm(N2, mean=0, sd=1)
y= 0.5*x + rnorm(N2, mean=0, sd=sqrt(1.5))
ds2 <- data.frame(x, y)


# Define the matrices
M <- mxMatrix(type = "Full", nrow = 1, ncol = 2, values=0,
              free=TRUE, labels=c("Mx", "My"), name = "M")
S1 <- mxMatrix(type = "Diag", nrow = 2, ncol = 2, values=1, 
              free=TRUE, labels=c("Vx", "ResidVy1"), name = "S")
S2 <- mxMatrix(type = "Diag", nrow = 2, ncol = 2, values=1, 
              free=TRUE, labels=c("Vx", "ResidVy2"), name = "S")
A <- mxMatrix(type = "Full", nrow = 2, ncol = 2, values=c(0,1,0,0), 
              free=c(FALSE,TRUE,FALSE,FALSE), labels=c(NA, "b", NA, NA),
              name = "A")
I <- mxMatrix(type="Iden", nrow=2, ncol=2, name="I")


# Define the expectation
expect <- mxExpectationRAM('A', 'S', 'I', 'M', dimnames=dsNames)


# Choose a fit function
fitFunction <- mxFitFunctionML(rowDiagnostics=TRUE)
# also return row likelihoods, even though the fit function
#  value is still 1x1

# Multiple groupd fit function sums the model likelihoods
#  from its component models
mgFitFun <- mxFitFunctionMultigroup(c('g1model', 'g2model'))


# Define the models
m1 <- mxModel(model="g1model", M, S1, A, I, expect, fitFunction, 
              mxData(observed=cov(ds1), type="cov", numObs=nrow(ds1),
                     means=colMeans(ds1)))
m2 <- mxModel(model="g2model", M, S2, A, I, expect, fitFunction, 
              mxData(observed=cov(ds2), type="cov", numObs=nrow(ds2),
                     means=colMeans(ds2)))
mg <- mxModel(model='multipleGroup', m1, m2, mgFitFun)

# Fit the model and print a summary

mgOut <- mxRun(mg)

# Look at summary of model
summary(mgOut)

# Examine fit function results
fitResOnly <- mxEval(fitfunction, mgOut)
( g1Fit <- mxEval(g1model.fitfunction, mgOut) )
( g2Fit <- mxEval(g2model.fitfunction, mgOut) )





