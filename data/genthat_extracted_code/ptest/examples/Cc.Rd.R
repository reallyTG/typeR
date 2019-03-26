library(ptest)


### Name: Cc
### Title: Microarray time series experiment for Caulobacter crescentus
###   bacterial cell cycle
### Aliases: Cc
### Keywords: datasets

### ** Examples

data(Cc)
qqnorm(colMeans(Cc, na.rm=TRUE))
qqnorm(rowMeans(Cc, na.rm=TRUE))



