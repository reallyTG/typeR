library(corehunter)


### Name: evaluateCore
### Title: Evaluate a core collection using the specified objective.
### Aliases: evaluateCore

### ** Examples

## No test: 
data <- exampleData()
core <- sampleCore(data, objective("EN", "PD"))
evaluateCore(core, data, objective("EN", "PD"))
evaluateCore(core, data, objective("AN", "MR"))
evaluateCore(core, data, objective("EE", "GD"))
evaluateCore(core, data, objective("CV"))
evaluateCore(core, data, objective("HE"))
## End(No test)




