library(cNORM)


### Name: derivationTable
### Title: Create a table based on first order derivative of the regression
###   model for specific age
### Aliases: derivationTable

### ** Examples

normData <- prepareData()
m <- bestModel(data = normData)
d <- derivationTable(6, m, step = 0.5)



