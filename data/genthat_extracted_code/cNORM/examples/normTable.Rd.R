library(cNORM)


### Name: normTable
### Title: Create a norm table based on model for specific age
### Aliases: normTable

### ** Examples

normData <- prepareData()
m <- bestModel(data = normData)

# create single norm table
norms <- normTable(3.5, m, minNorm = 25, maxNorm = 75, step = 0.5)

# create list of norm tables
norms <- normTable(c(2.5, 3.5, 4.5), m,
  minNorm = 25, maxNorm = 75,
  step = 1, minRaw = 0, maxRaw = 26
)



