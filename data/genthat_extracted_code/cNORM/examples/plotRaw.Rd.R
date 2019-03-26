library(cNORM)


### Name: plotRaw
### Title: Plot manifest and fitted raw scores
### Aliases: plotRaw

### ** Examples

# Load example data set, compute model and plot results
normData <- prepareData()
m <- bestModel(data = normData)
plotRaw(normData, m, group="group")



