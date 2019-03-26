library(cNORM)


### Name: elfe
### Title: Sentence completion test from ELFE 1-6
### Aliases: elfe
### Keywords: datasets

### ** Examples

# prepare data, retrieve model and plot percentiles
data.elfe <- prepareData(elfe)
model.elfe <- bestModel(data.elfe)
plotPercentiles(data.elfe, model.elfe)



