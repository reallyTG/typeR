library(OpenMx)


### Name: Named-entity
### Title: Named Entities
### Aliases: Named-entity Named-entities named-entity named-entities

### ** Examples


library(OpenMx)

# Create a model, add a matrix to it, and then access the matrix by name.

testModel <- mxModel(model="anEmptyModel")

testMatrix <- mxMatrix(type="Full", nrow=2, ncol=2, values=c(1,2,3,4), name="yourMatrix")

yourModel <- mxModel(testModel, testMatrix, name="noLongerEmpty")

yourModel$yourMatrix






