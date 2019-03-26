library(cNORM)


### Name: rawTable
### Title: Create a table with norm scores assigned to raw scores for a
###   specific age based on the regression model
### Aliases: rawTable

### ** Examples

normData <- prepareData()
m <- bestModel(data = normData)
# generate a norm table for the raw value range from 0 to 28 for month 7 of grade 3
table <- rawTable(3 + 7 / 12, m, minRaw = 0, maxRaw = 28)

# generate several raw tables
table <- rawTable(c(2.5, 3.5, 4.5), m, minRaw = 0, maxRaw = 28)



