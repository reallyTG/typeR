library(HistogramTools)


### Name: InformationLoss
### Title: Information Loss Metrics for Histograms
### Aliases: KSDCC EMDCC PlotKSDCC PlotEMDCC

### ** Examples

x <- rexp(1000)
h <- hist(x, breaks=c(0,1,2,3,4,8,16,32), plot=FALSE)
KSDCC(h)

# For small enough data sets we can construct the two extreme data sets
# that can be constructed from a histogram.  One assuming every data point
# is on the left boundary of its bucket, and another assuming every data
# point is on the right boundary of its bucket.  Our KSDCC metric for
# histograms is equivalent to the ks.test statistics for these two
# extreme data sets.

x.min <- rep(head(h$breaks, -1), h$counts)
x.max <- rep(tail(h$breaks, -1), h$counts)
ks.test(x.min, x.max, exact=FALSE)

## Not run: 
##D PlotKSDCC(h)
## End(Not run)

EMDCC(h)
## Not run: 
##D PlotEMDCC(h)
## End(Not run)



