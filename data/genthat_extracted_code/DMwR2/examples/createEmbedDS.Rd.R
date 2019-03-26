library(DMwR2)


### Name: createEmbedDS
### Title: Creates an embeded data set from an univariate time series
### Aliases: createEmbedDS
### Keywords: models

### ** Examples

## A simple example with a random time series
x <- rnorm(100)
head(x)
dataSet <- createEmbedDS(x,emb=5)
head(dataSet)



