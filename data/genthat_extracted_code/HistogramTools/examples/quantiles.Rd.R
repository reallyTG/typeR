library(HistogramTools)


### Name: quantile
### Title: Histogram Approximate Quantiles.
### Aliases: ApproxQuantile ApproxMean Count
### Keywords: methods manip utilities

### ** Examples

x <- hist(c(1,2,3), breaks=c(0,1,2,3,4,5,6,7,8,9), plot=FALSE)
Count(x)
ApproxMean(x)
ApproxQuantile(x, .5)
ApproxQuantile(x, c(.05, .95))



