library(intamap)


### Name: getIntamapParams
### Title: Setting parameters for the intamap package
### Aliases: getIntamapParams
### Keywords: spatial

### ** Examples

# Create a new set of intamapParameters, with default parameters:
params = getIntamapParams()
# Make modifications to the default list of parameters
params = getIntamapParams(newPar=list(removeBias = "local",
              secondParameter = "second"))
# Make modifications to an existing list of parameters
params = getIntamapParams(oldPar = params,newPar = list(predictType = list(exc=TRUE)))




