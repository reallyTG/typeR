library(RSNNS)


### Name: denormalizeData
### Title: Revert data normalization
### Aliases: denormalizeData

### ** Examples

data(iris)
values <- normalizeData(iris[,1:4])
denormalizeData(values, getNormParameters(values))



