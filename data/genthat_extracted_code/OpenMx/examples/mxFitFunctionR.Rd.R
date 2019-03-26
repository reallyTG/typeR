library(OpenMx)


### Name: mxFitFunctionR
### Title: Create MxFitFunctionR Object
### Aliases: mxFitFunctionR MxFitFunctionR-class
###   print,MxFitFunctionR-method show,MxFitFunctionR-method

### ** Examples


# Create and fit a model using mxFitFunctionR

library(OpenMx)

A <- mxMatrix(nrow = 2, ncol = 2, values = c(1:4), free = TRUE, name = 'A')
squared <- function(x) { x ^ 2 }

# Define the objective function in R

objFunction <- function(model, state) {
    values <- model$A$values 
    return(squared(values[1,1] - 4) + squared(values[1,2] - 3) +
        squared(values[2,1] - 2) + squared(values[2,2] - 1))
}

# Define the expectation function

fitFunction <- mxFitFunctionR(objFunction)

# Define the model

tmpModel <- mxModel(model="exampleModel", A, fitFunction)

# Fit the model and print a summary

tmpModelOut <- mxRun(tmpModel)
summary(tmpModelOut)




