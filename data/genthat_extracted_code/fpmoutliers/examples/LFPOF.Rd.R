library(fpmoutliers)


### Name: LFPOF
### Title: LFPOF algorithm
### Aliases: LFPOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- LFPOF(dataFrame, minSupport = 0.001)



