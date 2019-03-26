library(rtop)


### Name: getRtopParams
### Title: Setting parameters for the intamap package
### Aliases: getRtopParams
### Keywords: spatial

### ** Examples

# Create a new set of intamapParameters, with default parameters:
params = getRtopParams()
# Make modifications to the default list of parameters
params = getRtopParams(newPar = list(gDist = TRUE, nugget = FALSE))
# Make modifications to an existing list of parameters
params = getRtopParams(params = params, newPar = list(gDist = TRUE,
         nugget = FALSE))



