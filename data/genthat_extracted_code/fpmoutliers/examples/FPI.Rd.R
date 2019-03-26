library(fpmoutliers)


### Name: FPI
### Title: FPI - Frequent Pattern Isolation algorithm
### Aliases: FPI

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- FPI(dataFrame, minSupport = 0.001)



