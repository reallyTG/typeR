library(HistogramTools)


### Name: AddHistograms
### Title: Aggregate histograms that have identical breaks.
### Aliases: AddHistograms .NewHistogramName
### Keywords: manip utilities

### ** Examples

hist.1 <- hist(c(1,2,3,4), plot=FALSE)
hist.2 <- hist(c(1,2,2,4), plot=FALSE)
hist.sum <- AddHistograms(hist.1, hist.2)
hist.3 <- hist(c(1,2,2,4), plot=FALSE)
hist.sum <- AddHistograms(hist.1, hist.2, hist.3)



