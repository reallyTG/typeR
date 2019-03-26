library(cNORM)


### Name: plotPercentiles
### Title: Plot norm curves against actual percentiles
### Aliases: plotPercentiles

### ** Examples

# Load example data set, compute model and plot results
normData <- prepareData()
m <- bestModel(data = normData)
plotPercentiles(normData, m)



