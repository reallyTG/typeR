library(ptest)


### Name: cdc15
### Title: Microarray time series experiment for yeast cell cycle from
###   cdc15 experiment
### Aliases: cdc15
### Keywords: datasets

### ** Examples

data(cdc15)
qqnorm(colMeans(cdc15, na.rm=TRUE))
qqnorm(rowMeans(cdc15, na.rm=TRUE))



