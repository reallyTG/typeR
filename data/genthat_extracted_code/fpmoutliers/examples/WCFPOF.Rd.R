library(fpmoutliers)


### Name: WCFPOF
### Title: WCFPOF algorithm
### Aliases: WCFPOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- WCFPOF(dataFrame, minSupport = 0.001)



