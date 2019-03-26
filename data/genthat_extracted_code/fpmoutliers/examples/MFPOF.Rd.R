library(fpmoutliers)


### Name: MFPOF
### Title: MFPOF algorithm
### Aliases: MFPOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- MFPOF(dataFrame, minSupport = 0.001)



