library(fpmoutliers)


### Name: WFPI
### Title: WFPI - Weighted Frequent Pattern Isolation algorithm
### Aliases: WFPI

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- WFPI(dataFrame, minSupport = 0.001, preferredColumn="Car", preference=10)



