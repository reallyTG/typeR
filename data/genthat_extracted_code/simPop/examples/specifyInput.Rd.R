library(simPop)


### Name: specifyInput
### Title: create an object of class 'dataObj' required for further
###   processing
### Aliases: specifyInput
### Keywords: method

### ** Examples

data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", weight="rb050", strata="db040")
class(inp)
inp



