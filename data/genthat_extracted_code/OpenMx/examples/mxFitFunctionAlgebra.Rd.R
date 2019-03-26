library(OpenMx)


### Name: mxFitFunctionAlgebra
### Title: Create MxFitFunctionAlgebra Object
### Aliases: mxFitFunctionAlgebra MxFitFunctionAlgebra-class
###   print,MxFitFunctionAlgebra-method show,MxFitFunctionAlgebra-method

### ** Examples


# Create and fit a very simple model that adds two numbers using mxFitFunctionAlgebra

library(OpenMx)

# Create a matrix 'A' with no free parameters
A <- mxMatrix('Full', nrow = 1, ncol = 1, values = 1, name = 'A')

# Create an algebra 'B', which defines the expression A + A
B <- mxAlgebra(A + A, name = 'B')

# Define the objective function for algebra 'B'
objective <- mxFitFunctionAlgebra('B')

# Place the algebra, its associated matrix and 
# its objective function in a model
tmpModel <- mxModel(model="Addition", A, B, objective)

# Evalulate the algebra
tmpModelOut <- mxRun(tmpModel)

# View the results
tmpModelOut$output$minimum




