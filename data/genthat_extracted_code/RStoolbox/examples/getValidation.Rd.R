library(RStoolbox)


### Name: getValidation
### Title: Extract validation results from superClass objects
### Aliases: getValidation

### ** Examples

library(pls)
## Fit classifier (splitting training into 70% training data, 30% validation data)
train <- readRDS(system.file("external/trainingPoints.rds", package="RStoolbox"))
SC   <- superClass(rlogo, trainData = train, responseCol = "class", 
                    model="pls", trainPartition = 0.7)
## Independent testset-validation
getValidation(SC)
getValidation(SC, metrics = "classwise")
## Cross-validation based 
getValidation(SC, from = "cv")



