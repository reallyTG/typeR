library(ptest)


### Name: cdc28
### Title: Microarray time series experiment for yeast cell cycle from
###   cdc28 experiment
### Aliases: cdc28
### Keywords: datasets

### ** Examples

data(cdc28)
qqnorm(colMeans(cdc28, na.rm=TRUE))
qqnorm(rowMeans(cdc28, na.rm=TRUE))



