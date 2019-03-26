library(tseriesChaos)


### Name: embedd
### Title: Embedding of a time series
### Aliases: embedd
### Keywords: manip

### ** Examples

library(scatterplot3d)
x <- window(rossler.ts, start=90)
xyz <- embedd(x, m=3, d=8)
scatterplot3d(xyz, type="l")

## embedding multivariate time series
series <- cbind(seq(1,50),seq(101,150))
head(embedd(series, m=6, d=1))



