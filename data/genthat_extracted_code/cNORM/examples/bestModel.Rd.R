library(cNORM)


### Name: bestModel
### Title: Retrieve the best fitting regression model based on powers of A,
###   L and interactions
### Aliases: bestModel

### ** Examples

## Not run: 
##D # Standard example with sample data
##D normData <- prepareData()
##D model <- bestModel(normData)
##D plotSubset(model)
##D plotPercentiles(normData, model)
##D 
##D # It is possible to specify the variables explicitly - useful to smuggle
##D # in variables like sex
##D preselectedModel <- bestModel(normData, predictors = c("L1", "L3", "L1A3", "A2", "A3"))
##D print(regressionFunction(preselectedModel))
##D 
##D # Example for modeling based on continuous age variable and raw variable,
##D # based on the CDC data. We use the default k=4 parameter; raw variable has
##D # to be set to "bmi".
##D bmi.data <- prepareData(CDC, raw="bmi", group="group", age="age")
##D bmi.model <- bestModel(bmi.data, raw="bmi")
##D printSubset(bmi.model)
##D 
##D # Custom list of predictors (based on k = 3) and forcing in the sex variable
##D # While calculating the regression model works well, all other functions like
##D # plotting and norm table generation are not yet prepared to use covariates
##D bmi.sex <- bestModel(bmi.data, raw="bmi", predictors = c("L1", "L2", "L3",
##D                      "A1", "A2", "A3", "L1A1", "L1A2", "L1A3", "L2A1", "L2A2",
##D                      "L2A3", "L3A1", "L3A2", "L3A3", "sex"), force.in = c("sex"))
## End(Not run)



