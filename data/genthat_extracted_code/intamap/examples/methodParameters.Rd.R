library(intamap)


### Name: methodParameters
### Title: generate string for generation of method parameters
### Aliases: methodParameters methodParameters.default
###   methodParameters.copula methodParameters.idw
### Keywords: spatial

### ** Examples

data(meuse)
coordinates(meuse) = ~x+y
meuse$value = log(meuse$zinc)
# set up intamap object:
krigingObject = createIntamapObject(
		observations = meuse,
		formulaString = as.formula('value~1'),class = "automap")
# do estimation steps:
krigingObject = estimateParameters(krigingObject)
krigingObject = methodParameters(krigingObject)

# Create a new object
krigingObject2 = createIntamapObject(observations = meuse,
		formulaString = as.formula('value~1'),
    params = list(methodParameters = krigingObject$methodParameters))

krigingObject$variogramModel
krigingObject2$variogramModel




