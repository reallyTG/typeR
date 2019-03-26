library(cNORM)


### Name: prepareData
### Title: Set up example dataset and compute model
### Aliases: prepareData

### ** Examples

# conducts ranking and computation of powers and interactions with the 'elfe' dataset
data.elfe <- prepareData()

# variable names can be specified as well, here with the BMI data included in the package
data.bmi <- prepareData(CDC, group="group", raw="bmi", age="age")



