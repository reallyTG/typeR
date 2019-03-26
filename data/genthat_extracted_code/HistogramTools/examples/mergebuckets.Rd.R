library(HistogramTools)


### Name: MergeBuckets
### Title: Merge adjacent buckets in a histogram to create a new histogram.
### Aliases: MergeBuckets
### Keywords: methods manip utilities

### ** Examples

hist.1 <- hist(c(1,2,3), breaks=c(0,1,2,3,4,5,6,7,8,9), plot=FALSE)
hist.2 <- MergeBuckets(hist.1, adj.buckets=2)

hist.1
hist.2



