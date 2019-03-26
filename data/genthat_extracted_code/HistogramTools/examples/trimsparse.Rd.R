library(HistogramTools)


### Name: trimsparse
### Title: Trim the tails of a sparse histogram.
### Aliases: trimsparse trimhistogram TrimHistogram
### Keywords: methods manip utilities

### ** Examples

hist.1 <- hist(c(1,2,3), breaks=c(0,1,2,3,4,5,6,7,8,9), plot=FALSE)
length(hist.1$counts)
sum(hist.1$counts)
hist.trimmed <- TrimHistogram(hist.1)
length(hist.trimmed$counts)
sum(hist.trimmed$counts)



