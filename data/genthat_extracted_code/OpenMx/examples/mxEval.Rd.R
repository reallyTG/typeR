library(OpenMx)


### Name: mxEval
### Title: Evaluate Values in MxModel
### Aliases: mxEval mxEvalByName

### ** Examples


library(OpenMx)

# Set up a 1x1 matrix
matrixA <- mxMatrix("Full", nrow = 1, ncol = 1, values = 1, name = "A")

# Set up an algebra
algebraB <- mxAlgebra(A + A, name = "B")

# Put them both in a model
testModel <- mxModel(model="testModel", matrixA, algebraB)

# Even though the model has not been run, we can evaluate the algebra
#   given the starting values in matrixA.
mxEval(B, testModel, compute=TRUE)

# If we just print the algebra, we can see it has not been evaluated
testModel$B





