library(cNORM)


### Name: predictNorm
### Title: Retrieve norm value for raw score at a specific age
### Aliases: predictNorm

### ** Examples

normData <- prepareData()
m <- bestModel(data = normData)

# return norm value for raw value 21 for grade 2, month 9
# Use 'as.list(normData$raw)' and 'as.list(normData$group)' for raw scores
# and age to calculate predicted norm values for original data.
specificNormValue <- predictNorm(raw = 21, A = 2.75, model = m, minNorm = 25, maxNorm = 75)



