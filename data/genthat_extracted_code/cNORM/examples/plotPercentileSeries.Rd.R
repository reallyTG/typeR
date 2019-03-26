library(cNORM)


### Name: plotPercentileSeries
### Title: Generates a series of plots with number curves by percentile for
###   different models
### Aliases: plotPercentileSeries

### ** Examples

# Load example data set, compute model and plot results
normData <- prepareData(elfe)
model <- bestModel(data = normData)
plotPercentileSeries(normData, model, start=1, end=5, group="group")



