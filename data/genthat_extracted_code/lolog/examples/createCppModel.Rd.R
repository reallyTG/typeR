library(lolog)


### Name: createCppModel
### Title: Creates a model
### Aliases: createCppModel

### ** Examples

data(ukFaculty)
model <- createCppModel(ukFaculty ~ edges)
model$calculate()
model$statistics()



