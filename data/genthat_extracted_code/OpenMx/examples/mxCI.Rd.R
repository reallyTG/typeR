library(OpenMx)


### Name: mxCI
### Title: Create mxCI Object
### Aliases: mxCI

### ** Examples


library(OpenMx)

# generate data
covariance <- matrix(c(1.0, 0.5, 0.5, 1.0), 
    nrow=2, 
    dimnames=list(c("a", "b"), c("a", "b")))
    
data <- mxData(covariance, "cov", numObs=100)

# create an expected covariance matrix
expect <- mxMatrix("Symm", 2, 2,
    free=TRUE,
    values=c(1, .5, 1),
    labels=c("var1", "cov12", "var2"),
    name="expectedCov")

# request 95 percent confidence intervals   
ci <- mxCI(c("var1", "cov12", "var2"))

# specify the model
model <- mxModel(model="Confidence Interval Example",
    data, expect, ci,
    mxExpectationNormal("expectedCov", dimnames=c("a", "b")),
    mxFitFunctionML())

# run the model 
results <- mxRun(model, intervals=TRUE)

# view confidence intervals
print(summary(results)$CI)

# view all results
summary(results)

# remove a specific mxCI from a model
model <- mxModel(model, remove=TRUE, model$intervals[['cov12']])
model$intervals

# remove all mxCI from a model
model <- mxModel(model, remove=TRUE, model$intervals)
model$intervals




