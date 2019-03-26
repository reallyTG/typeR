library(HistogramTools)


### Name: SubsetHistogram
### Title: Subset a histogram by removing some of the buckets.
### Aliases: SubsetHistogram
### Keywords: methods manip utilities

### ** Examples

hist.1 <- hist(c(1,2,3), breaks=c(0,1,2,3,4,5,6,7,8,9), plot=FALSE)
hist.2 <- SubsetHistogram(hist.1, maxbreak=6)

hist.1
hist.2



