library(fpmoutliers)


### Name: WFPOF
### Title: WFPOF algorithm
### Aliases: WFPOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- WFPOF(dataFrame, minSupport = 0.001)



