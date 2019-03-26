library(ptest)


### Name: alpha
### Title: Microarray time series experiment for yeast cell cycle from
###   alpha experiment
### Aliases: alpha
### Keywords: datasets

### ** Examples

data(alpha)
qqnorm(colMeans(alpha, na.rm=TRUE))
qqnorm(rowMeans(alpha, na.rm=TRUE))



